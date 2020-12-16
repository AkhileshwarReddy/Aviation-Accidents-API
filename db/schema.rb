# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aviation", id: :serial, force: :cascade do |t|
    t.string "event_id", limit: 14, null: false
    t.string "investigation_type", limit: 8
    t.string "accident_number", limit: 11, null: false
    t.date "event_date", null: false
    t.string "location", limit: 63
    t.string "country", limit: 38
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "airport_code", limit: 10
    t.string "airport_name", limit: 33
    t.string "injury_severity", limit: 15, null: false
    t.string "aircraft_damage", limit: 11
    t.string "aircraft_category", limit: 17
    t.string "registration_number", limit: 11
    t.string "make", limit: 33
    t.string "model", limit: 20
    t.string "amateur_built", limit: 8
    t.string "number_of_engines", limit: 3
    t.string "engine_type", limit: 16
    t.string "far_description", limit: 33
    t.string "schedule", limit: 25
    t.string "purpose_of_flight", limit: 25
    t.string "air_carrier", limit: 90
    t.string "total_fatal_injuries", limit: 24
    t.decimal "total_serious_injuries"
    t.decimal "total_minor_injuries"
    t.decimal "total_uninjured"
    t.string "weather_condition", limit: 3
    t.string "broad_phase_of_flight", limit: 11
    t.string "report_status", limit: 14, null: false
    t.string "publication_date", limit: 14
    t.integer "country_id"
  end

  create_table "countries", id: :integer, default: nil, force: :cascade do |t|
    t.string "country", null: false
  end

  create_table "us_state_codes", primary_key: "us_state", id: { type: :string, limit: 17 }, force: :cascade do |t|
    t.string "abbreviation", limit: 2, null: false
  end

  add_foreign_key "aviation", "countries", name: "fk_countries"
end
