class CreateAvalancheInfos < ActiveRecord::Migration
  def change
    create_table :avalanche_infos do |t|
      t.string :location
      t.integer :skier_id
      t.string :name
      t.string :details

      t.timestamps

    end
  end
end
