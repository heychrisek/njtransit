class AddOldStopIdToStops < ActiveRecord::Migration
  def change
    add_column :stops, :old_stop_id, :integer
  end
end
