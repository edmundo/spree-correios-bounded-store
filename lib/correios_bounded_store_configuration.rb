class CorreiosBoundedStoreConfiguration < Configuration

  preference :web_service_url, :string, :default => "http://shopping.correios.com.br/wbm/shopping/script/consultarfrete.asmx"
  preference :company_code, :string, :default => "87724"
  preference :company_password, :string, :default => "01e12v81"
  preference :origin_zip, :string, :default => "93010090"
  
  
  # On error, if no option was given by the web service show the following to the user.

  # Say that this service will be used. Available options: pac, sedex. (Use a service available to everyone.)
  preference :on_error_default_service, :string, :default => "pac"
  # Charge this ammount, no matter what.
  preference :on_error_minimum_price, :decimal, :default => 10.99
  # Give this estimation of shipping time.
  preference :on_error_minimum_time, :integer, :default => 5
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
