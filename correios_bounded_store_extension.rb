# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class CorreiosBoundedStoreExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/correios_bounded_store"

  # Please use correios_bounded_store/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate
    # admin.tabs.add "Correios Bounded Store", "/admin/correios_bounded_store", :after => "Layouts", :visibility => [:all]
  end
end