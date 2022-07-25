require_relative 'base_handler'
require_relative '../models/dna'

class StatsHandler < BaseHandler
    def call
        [200, { 'Content-Type' => "application/json" }, [Dna.stats.to_json]]
    end
end