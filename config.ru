require_relative 'http/router'

class Application
    def call(env)
        req = Rack::Request.new env

        Router.new(req).call
    end
end

run Application.new