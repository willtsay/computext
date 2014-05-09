require_relative '../../db/config'

class User < ActiveRecord::Base
  has_many :contacts

end