class StopTime < ActiveRecord::Base
  belongs_to :trip
  belongs_to :stop

  def self.all_origin_departures(origin)
    origin.upcase!
    where("stop_id = 38174").joins(:trip).where('trip_headsign = ?', origin).order(:departure_time)
  end



  def self.next_origin_departure(origin)
    self.all_origin_departures(origin)#.order #(:departure_time - Time.now)
    # .where(departure_time between Time.now and two hours later)

    self.all_origin_departures(origin).where(:departure_time: Time.now..Time.now + #1hour)
  end

end
