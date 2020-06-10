class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |table|
      table.timestamps null: false
      table.string :name
      table.integer :year_completed
      table.integer :figure_id
    end
  end
end