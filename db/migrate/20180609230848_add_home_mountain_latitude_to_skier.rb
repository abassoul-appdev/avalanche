class AddHomeMountainLatitudeToSkier < ActiveRecord::Migration[5.0]
  def change
    add_column :skiers, :home_mountain_latitude, :float
  end
end
