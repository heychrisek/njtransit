# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140325020142) do

  create_table "calendar_dates", force: true do |t|
    t.integer  "service_id"
    t.integer  "date"
    t.integer  "exception_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", force: true do |t|
    t.integer  "route_id"
    t.string   "agency_id"
    t.string   "route_short_name"
    t.string   "route_long_name"
    t.integer  "route_type"
    t.string   "route_url"
    t.string   "route_color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shapes", force: true do |t|
    t.integer  "shape_id"
    t.decimal  "shape_pt_lat"
    t.decimal  "shape_pt_lon"
    t.integer  "shape_pt_sequence"
    t.decimal  "shape_dist_traveled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stop_times", force: true do |t|
    t.integer  "trip_id"
    t.float    "arrival_time"
    t.float    "departure_time"
    t.integer  "stop_id"
    t.integer  "stop_sequence"
    t.integer  "pickup_type"
    t.integer  "drop_off_type"
    t.float    "shape_dist_traveled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stops", force: true do |t|
    t.integer  "stop_code"
    t.string   "stop_name"
    t.decimal  "stop_lat"
    t.decimal  "stop_lon"
    t.integer  "zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.integer  "route_id"
    t.integer  "service_id"
    t.integer  "trip_id"
    t.string   "trip_headsign"
    t.integer  "direction_id"
    t.integer  "block_id"
    t.integer  "shape_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
