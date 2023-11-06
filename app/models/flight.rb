# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_airport_id', optional: true
  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id', optional: true

  delegate :code, to: :departure_airport, prefix: true, allow_nil: true
  delegate :code, to: :arrival_airport, prefix: true, allow_nil: true
end
