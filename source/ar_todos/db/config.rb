require 'active_record'
require_relative '../app/models/todolist'
require_relative '../app/models/task'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{File.dirname(__FILE__)}/../db/ar_todos.db")