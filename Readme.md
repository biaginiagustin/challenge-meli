# Challenge Meli - Agustin Biagini

## Requirements

 - PostgreSql server
 - Ruby > 2.6.8

## Instructions

### Create the databases
Assuming that you have postgres installed in your local machine and it doesn't require password
 ```
bundle exec rake db:create
 ```
 
### Migrate the database for both environments
```
bundle exec rake db:migrate RACK_ENV=development
bundle exec rake db:migrate RACK_ENV=test
```

### Run the server
```
bundle exec rackup config.ru
```
 
