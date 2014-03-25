# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

source = GTFS::Source.build('./rail_data.zip')

source.stop_times.each do |stop_time|
  StopTime.create(
    :trip_id => stop_time.trip_id,
    :departure_time => stop_time.departure_time,
    :stop_id => stop_time.stop_id
    )
end

source.trips.each do |trip|
  Trip.create(
    :route_id => trip.route_id,
    :direction_id => trip.direction_id,
    :trip_headsign => trip.headsign,
    :service_id => trip.service_id
    )
end

source.calendar_dates.each do |calendar_date|
  CalendarDate.create(
    :service_id => calendar_date.service_id,
    :date => calendar_date.date
    )
end

source.stops.each do |stop|
  Stop.create(
    :stop_code => stop.code,
    :stop_name => stop.name,
    )
end

source.routes.each do |route|
  Route.create(
    :route_long_name => route.long_name,
    )
end