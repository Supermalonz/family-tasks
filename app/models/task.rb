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
class Task < ApplicationRecord
  belongs_to :member, counter_cache: true

  enum status: {
    incomplete: 0,
    complete: 1
  }

  validates :description, presence: true, length: { minimum: 1, maximum: 100 }

  delegate :description, to: :member, prefix: true, allow_nil: true
end
