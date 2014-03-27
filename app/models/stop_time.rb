class StopTime < ActiveRecord::Base
  belongs_to :trip
  belongs_to :stop


  def self.all_departures(departure, headsign)
    headsign.upcase!
    #where stop_id is Secaucus and Headsign is ? (Spring Valley)
    where("stop_id = ?", Stop.find_old_stop_id_by_name(departure)).joins(:trip).where('trip_headsign = ?', headsign).order(:departure_time)
    # how does stop_id 38174 work? stop_id is 189   -   because stop_id is a table in stop_times...
  end



  def self.next_departure_from_to(departure, headsign)
    # gets departure time of next Secaucus - Pearl River train
    current_time = (Time.now.change(year: 2000, month: 01, day: 01) - 18000)
    self.all_departures(departure, headsign).where("departure_time > ?", current_time).pluck(:departure_time).first

    # self.all_origin_departures(origin)#.order #(:departure_time - Time.now)
    # .where(departure_time between Time.now and two hours later)
    # current_hour = Time.now.to_f

    # self.all_origin_departures(origin).where(departure_time: current_hour..(current_hour + 2)).pluck(:departure_time)

    # "open_at > ? and close_at < ?", Time.now.seconds_since_midnight, Time.now.seconds_since_midnight


    # newtime = Time.new.midnight
    # oldtime = Time.new(2000,01,01,0,0,0,"-04:00")
    # time_to_add = (newtime - oldtime).to_i

  end

#   def self.all_penn_departures(headsign)
#     headsign.upcase!
#     #where stop_id is penn and Headsign is ? (Spring Valley)
#     where("stop_id = 38174").joins(:trip).where('trip_headsign = ?', headsign).order(:departure_time)
#   end


#   def self.next_penn_departure_to(headsign)
# # gets departure time of next penn - Pearl River train
#     current_time = (Time.now.change(year: 2000, month: 01, day: 01) - 18000)
#     self.all_penn_departures(headsign).where("departure_time > ?", current_time).pluck(:departure_time).first
#   end

end
