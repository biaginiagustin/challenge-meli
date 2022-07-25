require 'active_record'
require 'erb'

ENV['APP_ENV'] ||= 'development'

def db_configuration
    db_configuration_file = File.join(File.expand_path('..', __FILE__), 'db', 'config.yml')
    YAML.load(ERB.new(db_configuration_file).result)
end

ActiveRecord::Base.establish_connection(db_configuration[ENV.fetch('APP_ENV')])