# frozen_string_literal: true

class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.integer :departure_airport
      t.integer :arrival_airport
      t.datetime :start_datetime
      t.integer :flight_duration

      t.timestamps
    end
  end
end
