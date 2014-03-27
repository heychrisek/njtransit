class Trip < ActiveRecord::Base
  belongs_to :route
  has_many :stop_times
  has_many :stops, :through => :stop_times

  def self.find_trips_by_stop(stop_name)
    stop_name.upcase!
    joins(:stops).where('stop_name = ?', "PEARL RIVER")#.pluck(:id)
  end
end
