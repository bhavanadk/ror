class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :duration
      t.integer :teamsize
      t.integer :cost
      t.string :domain

      t.timestamps null: false
    end
  end
end
