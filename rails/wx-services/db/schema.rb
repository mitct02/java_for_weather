# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100808111432) do

  create_table "archive_records", :force => true do |t|
    t.datetime "date",                                                                                     :null => false
    t.string   "location",                     :limit => 30,                               :default => "", :null => false
    t.decimal  "outside_temp",                               :precision => 4, :scale => 1
    t.decimal  "high_outside_temp",                          :precision => 4, :scale => 1
    t.decimal  "low_outside_temp",                           :precision => 4, :scale => 1
    t.decimal  "pressure",                                   :precision => 5, :scale => 3
    t.integer  "outside_humidity"
    t.float    "rainfall"
    t.float    "high_rain_rate"
    t.integer  "average_wind_speed",           :limit => 2
    t.integer  "high_wind_speed",              :limit => 2
    t.integer  "direction_of_high_wind_speed", :limit => 2
    t.integer  "prevailing_wind_direction",    :limit => 2
    t.decimal  "inside_temp",                                :precision => 4, :scale => 1
    t.decimal  "average_dewpoint",                           :precision => 4, :scale => 1
    t.integer  "average_apparent_temp",        :limit => 2
    t.integer  "inside_humidity",              :limit => 2
    t.integer  "average_solar_radiation"
    t.integer  "average_uv_index"
    t.integer  "et"
    t.integer  "high_solar_radiation"
    t.integer  "high_uv_index"
    t.integer  "forecastRule"
    t.integer  "leaf_temp_1"
    t.integer  "leaf_temp_2"
    t.integer  "leaf_wetness1"
    t.integer  "leaf_wetness2"
    t.integer  "soil_temp1"
    t.integer  "soil_temp2"
    t.integer  "soil_temp3"
    t.integer  "soil_temp4"
    t.integer  "extra_humidity1"
    t.integer  "extra_humidity2"
    t.integer  "extra_temp1"
    t.integer  "extra_temp2"
    t.integer  "extra_temp3"
    t.integer  "soil_moisture1"
    t.integer  "soil_moisture2"
    t.integer  "soil_moisture3"
    t.integer  "soil_moisture4"
    t.integer  "number_of_wind_samples"
    t.integer  "download_record_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "outside_temp_m"
    t.float    "low_outside_temp_m"
    t.float    "high_outside_temp_m"
    t.float    "inside_temp_m"
    t.float    "pressure_m"
    t.float    "rainfall_m"
    t.float    "high_rain_rate_m"
    t.float    "average_wind_speed_m"
    t.float    "high_wind_speed_m"
    t.float    "average_dewpoint_m"
    t.float    "average_apparent_temp_m"
  end

  add_index "archive_records", ["average_apparent_temp"], :name => "index_archive_records_on_average_apparent_temp"
  add_index "archive_records", ["average_dewpoint"], :name => "index_archive_records_on_average_dewpoint"
  add_index "archive_records", ["date", "location"], :name => "date_loc", :unique => true
  add_index "archive_records", ["date"], :name => "dates"
  add_index "archive_records", ["location", "date", "high_outside_temp"], :name => "index_archive_records_on_location_and_date_and_high_outside_temp"
  add_index "archive_records", ["location", "date", "high_wind_speed"], :name => "index_archive_records_on_location_and_date_and_high_wind_speed"
  add_index "archive_records", ["location", "date", "low_outside_temp"], :name => "index_archive_records_on_location_and_date_and_low_outside_temp"
  add_index "archive_records", ["location", "date", "rainfall"], :name => "index_archive_records_on_location_and_date_and_rainfall"
  add_index "archive_records", ["location"], :name => "locations"
  add_index "archive_records", ["outside_humidity"], :name => "index_archive_records_on_outside_humidity"
  add_index "archive_records", ["pressure"], :name => "index_archive_records_on_pressure"

  create_table "climates", :force => true do |t|
    t.string   "location",              :limit => 30, :null => false
    t.integer  "month",                               :null => false
    t.integer  "day",                                 :null => false
    t.integer  "avg_high_temp"
    t.integer  "avg_low_temp"
    t.integer  "mean_temp"
    t.integer  "record_high_temp"
    t.integer  "record_high_temp_year"
    t.integer  "record_low_temp"
    t.integer  "record_low_temp_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "climates", ["day"], :name => "index_climates_on_day"
  add_index "climates", ["location"], :name => "index_climates_on_location"
  add_index "climates", ["month"], :name => "index_climates_on_month"

  create_table "current_conditions", :force => true do |t|
    t.string   "location",              :limit => 30,                               :default => "", :null => false
    t.datetime "sample_date"
    t.decimal  "outside_temperature",                 :precision => 4, :scale => 1
    t.integer  "outside_humidity",      :limit => 2
    t.decimal  "dewpoint",                            :precision => 4, :scale => 1
    t.integer  "apparent_temp",         :limit => 2
    t.float    "pressure"
    t.string   "bar_status",            :limit => 25
    t.integer  "windspeed",             :limit => 2
    t.integer  "wind_direction",        :limit => 2
    t.boolean  "is_raining"
    t.float    "rain_rate"
    t.integer  "uv"
    t.integer  "solar_radiation"
    t.float    "daily_rain"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "inside_temperature"
    t.integer  "inside_humidity"
    t.integer  "ten_min_avg_wind"
    t.datetime "sunrise"
    t.datetime "sunset"
    t.float    "monthly_rain"
    t.float    "yearly_rain"
    t.float    "storm_rain"
    t.float    "outside_temperature_m"
    t.float    "inside_temperature_m"
    t.float    "dewpoint_m"
    t.float    "apparent_temp_m"
    t.float    "pressure_m"
    t.float    "windspeed_m"
    t.float    "rain_rate_m"
    t.float    "ten_min_avg_wind_m"
    t.float    "daily_rain_m"
    t.float    "monthly_rain_m"
    t.float    "yearly_rain_m"
    t.float    "storm_rain_m"
  end

  add_index "current_conditions", ["location"], :name => "index_current_conditions_on_location"

  create_table "forecast_periods", :force => true do |t|
    t.integer  "noaa_forecast_id",               :default => 0,  :null => false
    t.string   "name",             :limit => 20, :default => "", :null => false
    t.text     "text"
    t.datetime "created_at"
    t.string   "icon_location",                  :default => "", :null => false
    t.datetime "updated_at"
    t.integer  "temp"
    t.text     "weather"
    t.integer  "pop"
  end

  add_index "forecast_periods", ["noaa_forecast_id"], :name => "noaa_forecast_id"

  create_table "noaa_conditions", :force => true do |t|
    t.datetime "created_at"
    t.string   "location",       :limit => 30, :default => "", :null => false
    t.datetime "updated_at"
    t.text     "conditions"
    t.datetime "as_of"
    t.integer  "visibility"
    t.text     "conditions_xml"
  end

  add_index "noaa_conditions", ["as_of"], :name => "index_noaa_conditions_on_as_of"
  add_index "noaa_conditions", ["created_at"], :name => "created_at"
  add_index "noaa_conditions", ["location"], :name => "location"

  create_table "noaa_forecasts", :force => true do |t|
    t.text     "forecast_xml",                                 :null => false
    t.datetime "created_at"
    t.string   "location",       :limit => 30, :default => "", :null => false
    t.datetime "updated_at"
    t.datetime "creation_time"
    t.datetime "last_retrieved"
  end

  add_index "noaa_forecasts", ["created_at"], :name => "created_at"
  add_index "noaa_forecasts", ["location"], :name => "location"

  create_table "old_archive_records", :force => true do |t|
    t.datetime "date",                                                                                     :null => false
    t.string   "location",                     :limit => 30,                               :default => "", :null => false
    t.decimal  "outside_temp",                               :precision => 4, :scale => 1
    t.decimal  "high_outside_temp",                          :precision => 4, :scale => 1
    t.decimal  "low_outside_temp",                           :precision => 4, :scale => 1
    t.decimal  "pressure",                                   :precision => 5, :scale => 3
    t.integer  "outside_humidity"
    t.float    "rainfall"
    t.float    "high_rain_rate"
    t.integer  "average_wind_speed"
    t.integer  "high_wind_speed"
    t.integer  "direction_of_high_wind_speed"
    t.integer  "prevailing_wind_direction"
    t.decimal  "inside_temp",                                :precision => 4, :scale => 1
    t.decimal  "average_dewpoint",                           :precision => 4, :scale => 1
    t.integer  "average_apparent_temp"
    t.integer  "inside_humidity"
    t.integer  "average_solar_radiation"
    t.integer  "average_uv_index"
    t.integer  "et"
    t.integer  "high_solar_radiation"
    t.integer  "high_uv_index"
    t.integer  "forecastRule"
    t.integer  "leaf_temp_1"
    t.integer  "leaf_temp_2"
    t.integer  "leaf_wetness1"
    t.integer  "leaf_wetness2"
    t.integer  "soil_temp1"
    t.integer  "soil_temp2"
    t.integer  "soil_temp3"
    t.integer  "soil_temp4"
    t.integer  "extra_humidity1"
    t.integer  "extra_humidity2"
    t.integer  "extra_temp1"
    t.integer  "extra_temp2"
    t.integer  "extra_temp3"
    t.integer  "soil_moisture1"
    t.integer  "soil_moisture2"
    t.integer  "soil_moisture3"
    t.integer  "soil_moisture4"
    t.integer  "number_of_wind_samples"
    t.integer  "download_record_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "outside_temp_m"
    t.float    "low_outside_temp_m"
    t.float    "high_outside_temp_m"
    t.float    "inside_temp_m"
    t.float    "pressure_m"
    t.float    "rainfall_m"
    t.float    "high_rain_rate_m"
    t.float    "average_wind_speed_m"
    t.float    "high_wind_speed_m"
    t.float    "average_dewpoint_m"
    t.float    "average_apparent_temp_m"
  end

  add_index "old_archive_records", ["average_apparent_temp"], :name => "index_old_archive_records_on_average_apparent_temp"
  add_index "old_archive_records", ["average_dewpoint"], :name => "index_old_archive_records_on_average_dewpoint"
  add_index "old_archive_records", ["date", "location"], :name => "date_loc", :unique => true
  add_index "old_archive_records", ["date"], :name => "dates"
  add_index "old_archive_records", ["location"], :name => "locations"
  add_index "old_archive_records", ["outside_humidity"], :name => "index_old_archive_records_on_outside_humidity"
  add_index "old_archive_records", ["pressure"], :name => "index_old_archive_records_on_pressure"

  create_table "past_summaries", :force => true do |t|
    t.string   "period",                 :limit => 20,                               :null => false
    t.decimal  "avgDewpoint",                          :precision => 6, :scale => 1
    t.integer  "avgHumidity",            :limit => 8
    t.decimal  "avgPressure",                          :precision => 6, :scale => 2
    t.decimal  "avgTemp",                              :precision => 6, :scale => 1
    t.integer  "avgWindspeed",           :limit => 8
    t.integer  "avgWindchill",           :limit => 8
    t.integer  "hiDewpoint",             :limit => 8
    t.integer  "hiWindspeed",            :limit => 8
    t.integer  "hiOutsideHumidity",      :limit => 8
    t.decimal  "hiPressure",                           :precision => 6, :scale => 1
    t.decimal  "hiTemp",                               :precision => 6, :scale => 1
    t.integer  "hiWindchill",            :limit => 8
    t.integer  "lowDewpoint",            :limit => 8
    t.integer  "lowOutsideHumidity",     :limit => 8
    t.decimal  "lowPressure",                          :precision => 6, :scale => 1
    t.decimal  "lowTemp",                              :precision => 6, :scale => 1
    t.integer  "lowWindchill",           :limit => 8
    t.decimal  "rain",                                 :precision => 6, :scale => 2
    t.datetime "hiTempDate"
    t.datetime "lowTempDate"
    t.datetime "gustDate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "startdate"
    t.datetime "enddate"
    t.integer  "degreeDays"
    t.string   "location",               :limit => 30,                               :null => false
    t.integer  "gustDir"
    t.datetime "hiPressureDate"
    t.datetime "lowPressureDate"
    t.datetime "hiDewpointDate"
    t.datetime "lowDewpointDate"
    t.datetime "hiWindchillDate"
    t.datetime "lowWindchillDate"
    t.datetime "hiOutsideHumidityDate"
    t.datetime "lowOutsideHumidityDate"
  end

  add_index "past_summaries", ["hiDewpointDate"], :name => "index_past_summaries_on_hiDewpointDate"
  add_index "past_summaries", ["hiOutsideHumidityDate"], :name => "index_past_summaries_on_hiOutsideHumidityDate"
  add_index "past_summaries", ["hiPressureDate"], :name => "index_past_summaries_on_hiPressureDate"
  add_index "past_summaries", ["hiWindchillDate"], :name => "index_past_summaries_on_hiWindchillDate"
  add_index "past_summaries", ["location", "period"], :name => "index_past_summaries_on_location_and_period", :unique => true
  add_index "past_summaries", ["lowDewpointDate"], :name => "index_past_summaries_on_lowDewpointDate"
  add_index "past_summaries", ["lowOutsideHumidityDate"], :name => "index_past_summaries_on_lowOutsideHumidityDate"
  add_index "past_summaries", ["lowPressureDate"], :name => "index_past_summaries_on_lowPressureDate"
  add_index "past_summaries", ["lowWindchillDate"], :name => "index_past_summaries_on_lowWindchillDate"

  create_table "risesets", :force => true do |t|
    t.string  "location", :limit => 30, :null => false
    t.integer "month",                  :null => false
    t.integer "day",                    :null => false
    t.time    "rise"
    t.time    "set"
  end

  add_index "risesets", ["day"], :name => "index_risesets_on_day"
  add_index "risesets", ["location"], :name => "index_risesets_on_location"
  add_index "risesets", ["month"], :name => "index_risesets_on_month"

end
