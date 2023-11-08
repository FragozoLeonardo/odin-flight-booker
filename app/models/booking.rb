# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers
  accepts_nested_attributes_for :passengers
  validates :flight, presence: true


  delegate :passenger_name, to: :name, prefix: true, allow_nil: true
  delegate :passenger_email, to: :email, prefix: true, allow_nil: true

end
