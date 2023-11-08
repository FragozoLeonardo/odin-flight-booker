class AddPassengerToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :passenger, null: true, foreign_key: true
  end
end
