require 'active_record'

ActiveRecord::Base.establish_connection({
  adapter: 'sqlite3',
  database: 'drone_strikes.sqlite3'
})

 ActiveRecord::Base.logger = Logger.new(STDOUT)
