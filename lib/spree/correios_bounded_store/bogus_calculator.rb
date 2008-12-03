module Spree
  module CorreiosBoundedStore
    # Bogus calcualtor for testing purposes.  Uses the common functionality of CorreiosBoundedStoreCalculator
    # but doesn't actually use a real SOAP request to obtain rates.
    class BogusCalculator < CorreiosBoundedStoreCalculator  
      def soap_service
        Spree::CorreiosBoundedStore::BogusSoapService
      end
    end
  end
end