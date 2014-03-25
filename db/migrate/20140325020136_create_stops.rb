class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.integer :stop_code
      t.string :stop_name
      t.decimal :stop_lat
      t.decimal :stop_lon
      t.integer :zone_id
      t.timestamps
    end
  end
end
