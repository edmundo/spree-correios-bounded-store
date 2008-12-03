module Spree
  module CorreiosBoundedStore
    # Singleton class to access the tax configuration object (TaxConfiguration.first by default) and it's preferences.
    #
    # Usage:
    #   Spree::BrazilPostalService::Config[:foo]                  # Returns the foo preference
    #   Spree::BrazilPostalService::Config[]                      # Returns a Hash with all the tax preferences
    #   Spree::BrazilPostalService::Config.instance               # Returns the configuration object (TaxConfiguration.first)
    #   Spree::BrazilPostalService::Config.set(preferences_hash)  # Set the tax preferences as especified in +preference_hash+
    class Config
      include Singleton
      include PreferenceAccess
    
      class << self
        def instance
          return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
          CorreiosBoundedStoreConfiguration.find_or_create_by_name("Default Correios Bounded Store configuration")
        end
      end
    end
  end
end