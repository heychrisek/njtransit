class Trip < ActiveRecord::Base
  belongs_to :route
  has_many :stop_times
  has_many :stops, :through => :stop_times

  def self.next_trip_from_to(origin, destination)
    headsign = Trip.find_headsign_by_origin_destination(destination)
    puts "The train will depart from #{origin} at #{StopTime.next_departure_from_to(origin, headsign)}, arriving in #{destination} at #{StopTime.next_arrival_time(origin, destination, headsign)}."
  end

  def self.find_trips_by_destination(destination)
    destination.upcase!
    joins(:stops).where('stop_name = ?', destination)#.pluck(:id)
  end

  def self.find_headsign_by_origin_destination(destination)
    destination.upcase!
    joins(:stop_times).where('stop_id = ? AND direction_id = 1', Stop.find_old_stop_id_by_name(destination)).pluck(:trip_headsign).first
  end
end
