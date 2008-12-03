SERVICE_REFERENCES = {
  :pac_antigo => '41025', # Old table.
  :pac => '41068',        # New table with cubic weight.
  :sedex => '40096',
  :e_sedex => '81019'     # Returned only when available to the specified zip codes.
}

class CorreiosBoundedStoreCalculator
  
  def calculate_shipping(order)
    
    rates = Rails.cache.fetch(order) do                              
      rates = retrieve_rates(
        Spree::CorreiosBoundedStore::Config[:origin_zip],
        order.address.zipcode,
        total_weight(order),
        20 #total_volume(order)
      )
    end
    
    default_service = Spree::CorreiosBoundedStore::Config[:on_error_default_service]
    
    # Return an array containing available services or containing a fixed price service on error.
    if rates.empty? && rate_reference == default_service
      rate = {
        :code => rate_code,
        :price => Spree::CorreiosBoundedStore::Config[:on_error_minimum_price],
        :time => Spree::CorreiosBoundedStore::Config[:on_error_minimum_time]
      }
    elsif !rates.empty? && rate_reference != default_service
      rate = rates[rate_reference.to_sym]
    else
      rate = {:code => rate_code, :price => nil, :time => nil}
    end

    return rate[:price] 
  end

  protected 
  def rate_code
  end

  def rate_reference
  end

  def rate_name
  end

  private  
  # Retrieves an array of services using the postal web service through a SOAP request.
  def retrieve_rates(origin_zip, destination_zip, shipping_weight, shipping_volume)
    params = {
      'nCdEmpresa' => Spree::CorreiosBoundedStore::Config[:company_code],
      'sDsSenha' => Spree::CorreiosBoundedStore::Config[:company_password],
      'sCepOrigem' => origin_zip,
      'sCepDestino' => destination_zip,
      'nVlPeso' => shipping_weight,  # Must be in grams.
      'nVlVolume' => shipping_volume # Must be in cubic centimeters.
    }

    result = soap_service.consultarFrete(params)
    
    available_services = {}
    
    case result.consultarFreteResult.codigo
    when 1
    # 1 OK.
      if result.consultarFreteResult.fretesDisponiveis.respond_to? :each
        result.consultarFreteResult.fretesDisponiveis.each do |i|
          available_services.merge!(
            SERVICE_REFERENCES.index(i.codigo).to_sym => {
              :code => i.codigo,       # Service code.
              :price => i.valor,       # Estimated shipping price.
              :time => i.prazoEntrega  # Estimated shipping time in days.
            }
          )
        end
      end
    else
    # 2 Serviço indisponível para este CEP.
    # 3 Parametros inválidos.
    # 4 Acesso não autorizado.
    # 5 Loja não aberta.
    # 6 Peso não atendido.
    # 7 Serviço indisponível, tente mais tarde.
      RAILS_DEFAULT_LOGGER.info "Error in the returned available shipping services: #{result.consultarFreteResult.codigo}, #{result.consultarFreteResult.descricao}"
    end
    
    available_services
  end

  # Return the total weight of the order in grams.
  def total_weight(order)
    weight = 0
    order.line_items.each do |line_item|
      line_item.variant.weight ? weight += (line_item.quantity * line_item.variant.weight) : 0
    end
    weight
  end

  # Return the total volume of the order in cubic centimeters.
  def total_volume(order)
    volume = 0
    order.line_items.each do |line_item|
      line_item.variant.volume ? volume += (line_item.quantity * line_item.variant.volume) : 0
    end
    volume
  end

end