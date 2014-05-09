require_relative '../config'

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :chore
      t.boolean :completed, :default => false
      t.belongs_to :todolist
      t.timestamps
    end
  end
end