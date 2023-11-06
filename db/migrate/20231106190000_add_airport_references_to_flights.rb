# frozen_string_literal: true

class AddAirportReferencesToFlights < ActiveRecord::Migration[7.1]
  def change
    add_reference :flights, :departure_airport, foreign_key: { to_table: :airports }
    add_reference :flights, :arrival_airport, foreign_key: { to_table: :airports }
  end
end
