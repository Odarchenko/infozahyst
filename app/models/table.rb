# frozen_string_literal: true

class Table < ApplicationRecord
  delegate :opening, to: :restaurant
  delegate :closing, to: :restaurant

  belongs_to :restaurant
  has_many :bookings
end
