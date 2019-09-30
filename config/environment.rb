require 'bundler/setup'
require 'pry'
require 'sinatra/activerecord'


Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

ActiveRecord::Base.establish_connection({adapter: 'sqlite3', database: 'db/quiz.db'})