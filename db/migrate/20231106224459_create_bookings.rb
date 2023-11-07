# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :email
      t.references :flight, null: false, foreign_key: true
      t.integer :passenger_count

      t.timestamps
    end
  end
end
