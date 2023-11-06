# frozen_string_literal: true

class AddPassengerCountToFlights < ActiveRecord::Migration[7.1]
  def change
    add_column :flights, :passenger_count, :integer
  end
end
