# Uncomment this if you reference any of your controllers in activate
require_dependency 'application'

class CorreiosBoundedStoreExtension < Spree::Extension
  version "0.99"
  description "Support for brazilian postal service online shiping price calculation, using a type of web service access contract called 'bounded store'."
  url "http://github.com/edmundo/spree-correios-bounded-store/tree/master"

  # Please use correios_bounded_store/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate
    # Add support for internationalization to this extension.
    Globalite.add_localization_source(File.join(RAILS_ROOT, 'vendor/extensions/correios_bounded_store/lang/ui'))

    # Add the administration link. (Only as a placeholder)
    Admin::ConfigurationsController.class_eval do
      before_filter :add_correios_bounded_store_link, :only => :index
      def add_correios_bounded_store_link
        @extension_links << {:link => "#" , :link_text => Globalite.localize(:ext_correios_bounded_store), :description => Globalite.localize(:ext_correios_bounded_store_description)}
      end
    end
  end
end