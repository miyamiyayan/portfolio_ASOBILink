class AddIsActiveToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :is_active, :boolean, default: true, null: false
  end
end
