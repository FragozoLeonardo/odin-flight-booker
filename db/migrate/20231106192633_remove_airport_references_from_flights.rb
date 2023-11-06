# frozen_string_literal: true

class RemoveAirportReferencesFromFlights < ActiveRecord::Migration[7.1]
  def change
    # remove_foreign_key :flights, column: :departure_airport_id
    # remove_foreign_key :flights, column: :arrival_airport_id
  end
end
