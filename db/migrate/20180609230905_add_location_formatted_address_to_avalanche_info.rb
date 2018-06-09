class AddLocationFormattedAddressToAvalancheInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :avalanche_infos, :location_formatted_address, :string
  end
end
