class CreateShapes < ActiveRecord::Migration
  def change
    create_table :shapes do |t|
      t.integer :shape_id
      t.decimal :shape_pt_lat
      t.decimal :shape_pt_lon
      t.integer :shape_pt_sequence
      t.decimal :shape_dist_traveled
      t.timestamps
    end
  end
end
