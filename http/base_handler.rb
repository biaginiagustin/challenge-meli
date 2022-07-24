class BaseHandler
    def initialize(request)
        @request = request
    end

    def self.call(*args, &block)
        new(*args, &block).call
    end

    def call
        raise NotImplementedError
    end
end