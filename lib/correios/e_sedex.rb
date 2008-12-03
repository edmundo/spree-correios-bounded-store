module Correios
  class ESedex < Correios::Base
    def rate_code
      "81019"
    end

    def rate_reference
      "e_sedex"
    end

    def rate_name
      "Correios e-Sedex"
    end
  end
end