class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |table|
      table.string :name
      table.timestamps null: false
    end
  end
end