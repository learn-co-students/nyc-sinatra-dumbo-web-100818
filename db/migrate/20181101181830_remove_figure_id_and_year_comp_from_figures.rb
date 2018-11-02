class RemoveFigureIdAndYearCompFromFigures < ActiveRecord::Migration
  def change
    remove_column :figures, :figure_id, :integer
    remove_column :figures, :year_completed, :integer
  end
end
