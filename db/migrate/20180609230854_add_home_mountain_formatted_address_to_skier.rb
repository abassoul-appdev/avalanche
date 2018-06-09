class AddHomeMountainFormattedAddressToSkier < ActiveRecord::Migration[5.0]
  def change
    add_column :skiers, :home_mountain_formatted_address, :string
  end
end
