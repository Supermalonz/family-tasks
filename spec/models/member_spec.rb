# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  tasks_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

describe Member, type: :model do

  describe 'valid factory' do
    subject { build(:member) }

    it { is_expected.to be_valid }
  end

  describe 'validations' do
    subject(:member) { create(:member) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:tasks_count) }
  end
end
