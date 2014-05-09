require_relative '../../db/config'

class Contact < ActiveRecord::Base
  validates :number, presence: true, uniqueness: true

end