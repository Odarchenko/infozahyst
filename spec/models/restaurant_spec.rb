# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:restaurant) { build(:restaurant) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:opening) }
    it { is_expected.to validate_presence_of(:closing) }
    it { is_expected.to validate_inclusion_of(:closing).in_array(%w[0 2.day.seconds]) }
    it { is_expected.to validate_inclusion_of(:opening).in_array(%w[0 1.day.seconds]) }

    it 'check opening time' do
      expect(restaurant.opening_time).to eq('12:00')
    end

    it 'check closing time' do
      expect(restaurant.closing_time).to eq('00:00')
    end
  end
end
