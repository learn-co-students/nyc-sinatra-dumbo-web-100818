class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |t|
      t.string :name
      t.integer :figure_id
      t.integer :year_completed
    end
  end
end
