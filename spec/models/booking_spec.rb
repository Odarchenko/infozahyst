# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Booking, type: :model do
  let(:booking) { build(:booking) }
  let(:table) { build(:table) }
  let(:user) { build(:user) }
  let(:restaurant) { build(:restaurant) }

  before(:each) do
    user.save
    restaurant.save
    table.save
  end

  it 'correct booking' do
    expect(booking).to be_valid
  end

  it 'wrong duration' do
    booking.duration = 1801
    expect(booking).to_not be_valid
  end

  it 'fail without user id' do
    booking.user_id = nil
    expect(booking).to_not be_valid
  end

  it 'fail without table id' do
    booking.user_id = nil
    expect(booking).to_not be_valid
  end

  it 'fail when try to book 2 times same table and time' do
    booking.save
    expect(booking).to_not be_valid
  end
  it 'fail when try to book when restaurant closed' do
    booking.start_time = booking.start_time - 10.hours.to_i
    expect(booking).to_not be_valid
  end
end
