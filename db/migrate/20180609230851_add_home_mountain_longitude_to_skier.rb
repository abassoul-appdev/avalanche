class AddHomeMountainLongitudeToSkier < ActiveRecord::Migration[5.0]
  def change
    add_column :skiers, :home_mountain_longitude, :float
  end
end
