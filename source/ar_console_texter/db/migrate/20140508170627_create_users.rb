require_relative '../config'

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :phone
      t.string :account_sid
      t.string :auth_token

      t.timestamps
    end
  end
end