require 'active_record'

ENV['APP_ENV'] ||= 'development'

def db_configuration
    db_configuration_file = File.join(File.expand_path('..', __FILE__), 'db', 'config.yml')
    YAML.load(File.read(db_configuration_file))
end

if ENV.fetch('APP_ENV') != 'production'
    ActiveRecord::Base.establish_connection(db_configuration[ENV.fetch('APP_ENV')])
else
    ActiveRecord::Base.establish_connection(ENV.fetch('DATABASE_URL'))
end