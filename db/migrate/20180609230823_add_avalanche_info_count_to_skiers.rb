class AddAvalancheInfoCountToSkiers < ActiveRecord::Migration[5.0]
  def change
    add_column :skiers, :avalanche_infos_count, :integer
  end
end
