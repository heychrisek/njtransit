class Stop < ActiveRecord::Base
  has_many :stop_times
  has_many :trips, :through => :stop_times

  def self.find_old_stop_id_by_name(stop_name)
    stop_name.upcase!
    find_by(:stop_name => stop_name).old_stop_id
    # where("stop_name = ?", stop_name)
  end

  def self.find_route_id_by_destination(destination)
    joins(:trips).where("stop_name = ?", destination).pluck(:route_id).first
  end

  def self.find_route_id_by_destination(destination)
  end
end
