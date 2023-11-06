# frozen_string_literal: true

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

ActiveRecord::Schema[7.1].define(version: 20_231_106_213_041) do
  create_table 'airports', force: :cascade do |t|
    t.string 'code'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'flights', force: :cascade do |t|
    t.integer 'departure_airport'
    t.integer 'arrival_airport'
    t.datetime 'start_datetime'
    t.integer 'flight_duration'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'departure_airport_id'
    t.integer 'arrival_airport_id'
    t.integer 'passenger_count'
    t.index ['arrival_airport_id'], name: 'index_flights_on_arrival_airport_id'
    t.index ['departure_airport_id'], name: 'index_flights_on_departure_airport_id'
  end

  add_foreign_key 'flights', 'airports', column: 'arrival_airport_id'
  add_foreign_key 'flights', 'airports', column: 'arrival_airport_id'
  add_foreign_key 'flights', 'airports', column: 'departure_airport_id'
  add_foreign_key 'flights', 'airports', column: 'departure_airport_id'
end
