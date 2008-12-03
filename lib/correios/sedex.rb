module Correios
  class Sedex < Correios::Base
    def rate_code
      "40096"
    end

    def rate_reference
      "sedex"
    end

    def rate_name
      "Correios Sedex"
    end
  end
end