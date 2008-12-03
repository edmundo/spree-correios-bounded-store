require 'soap/wsdlDriver'

module Correios
  class Base < CorreiosBoundedStoreCalculator
    def soap_service
      wsdl_url = Spree::CorreiosBoundedStore::Config[:web_service_url] + "?WSDL"
      soap = SOAP::WSDLDriverFactory.new(wsdl_url).create_rpc_driver
  
      # Write the request and result to local xml files.
      # soap.wiredump_file_base = "soapresult"
      
      soap
    end
  end
end