# frozen_string_literal: true

class Passenger < ApplicationRecord

  belongs_to :booking
  has_many :flights, through: :booking


end
