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
require 'rails_helper'

describe Task, type: :model do
  describe 'valid factory' do
    subject { build(:task) }

    it { is_expected.to be_valid }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:member) }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:status) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_least(1).is_at_most(100) }
  end
end
