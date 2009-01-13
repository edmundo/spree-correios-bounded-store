class Admin::ConfigurationsController < Admin::BaseController
  before_filter :add_correios_bounded_store_link, :only => :index

  def add_correios_bounded_store_link
    @extension_links << {
      :link => "#" ,
      :link_text => Globalite.localize(:ext_correios_bounded_store),
      :description => Globalite.localize(:ext_correios_bounded_store_description)
    }
  end
end
