require_relative 'base_handler'

class HomeHandler < BaseHandler
    def call
        [200, { "Content-Typt" => "application/json" }, [ '{"author" => "Agustin Biagini"}' ]]
    end
end