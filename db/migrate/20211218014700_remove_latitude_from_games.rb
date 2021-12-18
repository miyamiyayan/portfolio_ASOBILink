class RemoveLatitudeFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :latitude, :float
    remove_column :games, :longitude, :float

  end
end
