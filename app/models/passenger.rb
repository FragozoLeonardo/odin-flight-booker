class Passenger < ApplicationRecord
  belongs_to :booking
  has_one :flight, through: :booking
  delegate :departure_airport, :arrival_airport, to: :flight, allow_nil: true
end
