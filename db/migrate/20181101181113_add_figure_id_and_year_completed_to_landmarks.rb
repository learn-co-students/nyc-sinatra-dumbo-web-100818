class AddFigureIdAndYearCompletedToLandmarks < ActiveRecord::Migration
  def change
    add_column :landmarks, :figure_id, :integer
    add_column :landmarks, :year_completed, :integer
  end
end
