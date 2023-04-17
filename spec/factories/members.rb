# frozen_string_literal: true

FactoryBot.define do
  factory :member do
    sequence(:name) { |n| "John The #{n}" }
    tasks_count { 2 }
  end
end
