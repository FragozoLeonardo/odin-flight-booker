# frozen_string_literal: true

class AddCorrectAirportReferencesToFlights < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :flights, :airports, column: :departure_airport_id
    add_foreign_key :flights, :airports, column: :arrival_airport_id
  end
end
