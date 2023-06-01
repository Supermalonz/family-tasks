# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  status      :integer          default("incomplete"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  member_id   :bigint           not null
#
# Indexes
#
#  index_tasks_on_member_id  (member_id)
#
# Foreign Keys
#
#  fk_rails_...  (member_id => members.id)
#
FactoryBot.define do
  factory :task do
    member { create(:member) }
    description { 'cleaning'}
  end
end
