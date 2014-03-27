class Trip < ActiveRecord::Base
  belongs_to :route
  has_many :stop_times
  has_many :stops, :through => :stop_times

  def self.find_trips_by_destination(destination)
    destination.upcase!
    joins(:stops).where('stop_name = ?', destination)#.pluck(:id)
  end

  def self.find_headsign_by_origin_destination(origin, destination)
    destination.upcase!
    joins(:stop_times).where('stop_id = ?', destination)
  end
end
