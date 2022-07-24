require_relative 'base_handler'
require_relative '../lib/dna_checker'

class MutantHandler < BaseHandler
    def call
        dna = json_body['dna']

        if DNAChecker.new.isMutant(dna)
            [200, { 'Content-Type' => 'application/json' }, []]
        else
            [403, { 'Content-Type' => 'application/json' }, []]
        end
    end
end