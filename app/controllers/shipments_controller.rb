class ShipmentsController < Spree::BaseController

  # Overrides the method to set the default shipping_method to the configured fallback.
  def create        
    build_object
    load_object
    state_check("shipment")  
    unless @shipment_presenter.valid?
      render :action => "new" and return
    end
    @shipment = @order.shipments.new(:address => @shipment_presenter.address)

    default_method = nil
    @shipment.shipping_methods.each do |m|
      calculator = m.shipping_calculator.constantize.new
      default_method = m if calculator.rate_reference == Spree::CorreiosBoundedStore::Config[:on_error_default_service]
    end

    @shipment.shipping_method = default_method
    @shipment.save
    @order.next!
    redirect_to edit_order_shipment_url(@order, @shipment)
  end

end