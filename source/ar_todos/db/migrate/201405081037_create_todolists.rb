require_relative '../config'

class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
      t.string :name
      t.timestamps
    end
  end
end