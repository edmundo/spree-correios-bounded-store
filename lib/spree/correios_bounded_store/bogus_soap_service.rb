module Spree
  module CorreiosBoundedStore
    # Bogus SOAP service, useful for testing.
    class BogusSoapService
      def consultarFrete(params)
        RateResponse.new(true, "Bogus rate response.")
      end
    end
    
    class DefinedRateResponse
      def consultarFreteResult
        # Objeto com método fretesDisponiveis
      end
      
      def fretesDisponiveis
        # Array 
      end
    end
  end
end