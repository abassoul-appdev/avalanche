class AddLocationLongitudeToAvalancheInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :avalanche_infos, :location_longitude, :float
  end
end
