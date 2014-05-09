require_relative '../../db/config'

class Task < ActiveRecord::Base
  belongs_to :todolist
end


