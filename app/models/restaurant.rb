# frozen_string_literal: true

class Restaurant < ApplicationRecord
  ONE_DAY = 1.day.seconds
  TWO_DAYS = 2.day.seconds
  after_create :set_real_closing_time

  validates :opening, presence: true, inclusion: { in: 0..ONE_DAY }
  validates :closing, presence: true, inclusion: { in: 0..TWO_DAYS }

  has_many :tables
  has_many :bookings, through: :tables

  def opening_time
    Time.at(opening).utc.strftime('%H:%M')
  end

  def closing_time
    Time.at(closing).utc.strftime('%H:%M')
  end

  def set_real_closing_time
    return if closing > opening

    update(closing: closing + 1.day.seconds)
  end
end
