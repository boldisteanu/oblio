# frozen_string_literal: true
require_relative 'api'

module Oblio
    class Company
        def self.list()
            api = Oblio::Api.new()
            api.get('/nomenclature/companies', {})
        end
    end
end
