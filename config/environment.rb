require 'bundler/setup'
require 'pry'
require 'sinatra/activerecord'



Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

<<<<<<< HEAD
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: '../db/quiz.db')

ActiveRecord::Base.logger = nil
=======
ActiveRecord::Base.establish_connection({adapter: 'sqlite3', database: 'db/quiz.db'})

ActiveRecord::Base.logger = nil
>>>>>>> origin/master
