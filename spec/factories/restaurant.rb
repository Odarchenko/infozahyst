# frozen_string_literal: true

FactoryBot.define do
  factory :restaurant do
    id { 1 }
    name { 'name' }
    opening { 43_200 }
    closing { 86_400 }
  end
end
