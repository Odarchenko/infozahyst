# frozen_string_literal: true

class Booking < ApplicationRecord
  BOOKING_STEP = 1800 # 30 minutes
  validates :duration, presence: true
  validates :start_time, presence: true
  validate :overbooking, :restaurant_opened, :check_duration

  belongs_to :user
  belongs_to :table

  private

  def check_duration
    unless (duration % BOOKING_STEP).zero?
      errors.add(:duration, 'wrong duration')
     end
  end

  def overbooking
    return unless table.bookings.where("#{start_time} BETWEEN start_time AND start_time + duration - 1 " \
      "OR #{end_time} BETWEEN start_time + 1 AND start_time + duration").exists?

    errors.add(:start_time, 'overbooking')
  end

  def restaurant_opened
    if start_time.between?((booking_begging_of_day + table.opening), (booking_begging_of_day + table.closing - duration))
      return
    end

    errors.add(:start_time, 'restaurant_is closed')
  end

  def booking_begging_of_day
    Time.at(start_time).beginning_of_day.to_i
  end

  def end_time
    start_time + duration
  end
end
