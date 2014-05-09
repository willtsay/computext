require_relative '../../db/config'

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts
end