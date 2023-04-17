# frozen_string_literal: true

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
