module Correios
  class Default < Correios::Base
    def rate_code
      "DEFAULT"
    end

    def rate_reference
      "default"
    end

    def rate_name
      "Correios"
    end
  end
end