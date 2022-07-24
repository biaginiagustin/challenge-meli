# Bootstrap app
require_relative 'bootstrap'

# Require router and handlers
Dir[File.join(__dir__, 'http', '*.rb')].each { |file| require file }

class Application
    def call(env)
        req = Rack::Request.new env

        Router.new(req).call
    end
end

run Application.new