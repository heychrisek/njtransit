class CreateStopTimes < ActiveRecord::Migration
  def change
    create_table :stop_times do |t|
      t.integer :trip_id
      # t.string :arrival_time
      t.string :departure_time_string
      t.time :departure_time
      # t.datetime :departure_time_as_date_time
      t.integer :stop_id
      t.integer :stop_sequence
      t.integer :pickup_type
      # t.integer :drop_off_type
      # t.float :shape_dist_traveled
      t.timestamps
    end
  end
end
