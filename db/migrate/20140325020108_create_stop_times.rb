class CreateStopTimes < ActiveRecord::Migration
  def change
    create_table :stop_times do |t|
      t.integer :trip_id
      t.float :arrival_time
      t.float :departure_time
      t.integer :stop_id
      t.integer :stop_sequence
      t.integer :pickup_type
      t.integer :drop_off_type
      t.float :shape_dist_traveled
      t.timestamps
    end
  end
end
