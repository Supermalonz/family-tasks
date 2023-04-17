# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    member { create(:member) }
    description { 'cleaning'}
  end
end
