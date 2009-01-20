class Admin::ConfigurationsController < Admin::BaseController
  before_filter :add_correios_bounded_store_link, :only => :index

  def add_correios_bounded_store_link
    @extension_links << {
      :link => "#",
      :link_text => t('ext.correios_bounded_store.extension_name'),
      :description => t('ext.correios_bounded_store.extension_description')
    }
  end
end
