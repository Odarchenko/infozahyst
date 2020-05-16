# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    user_id { 1 }
    table_id { 1 }
    start_time { Time.now.to_i }
    duration { 1800 }
  end
end
