require 'json'

class BaseHandler
    attr :request

    def initialize(request)
        @request = request
    end

    def self.call(*args, &block)
        new(*args, &block).call
    end

    def call
        raise NotImplementedError
    end

    protected

    def json_body
        @json_body ||= JSON.parse(request.body.read)
    end
end