require_relative 'base_handler'

class HealthzHandler < BaseHandler
    def call
        [200, { 'Content-Type' => 'application/json' }, [ '{"status": "ok"}' ]]
    end
end