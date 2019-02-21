# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__
run Sinatra::Application

 if Sinatra::Application.development?
    set :database, {
      adapter: "sqlite3",
      database: "db/db.sqlite3"
    }
  else
    db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
    set :database, {
      adapter: "postgresql",
      host: db.host,
      username: db.user,
      password: db.password,
      database: db.path[1..-1],
      encoding: 'utf8'
    }
  end