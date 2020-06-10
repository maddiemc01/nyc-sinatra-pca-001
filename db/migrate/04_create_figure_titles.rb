class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do |table|
      table.timestamps null: true
      table.integer :figure_id, null: false
      table.integer :title_id, null: false
    end
  end
end