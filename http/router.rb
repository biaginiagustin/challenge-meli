class Router
    attr :request

    def initialize(request)
        @request = request
    end

    def call
        case request.path
        when "/"
            HomeHandler.new(request).call
        when "/healthz"
            HealthzHandler.new(request).call
        when "/mutant"
            MutantHandler.new(request).call
        else
            not_found
        end
    end

    private 

    def not_found
        [404, {'Content-Type' => 'application/json'}, [ "" ]]
    end
end