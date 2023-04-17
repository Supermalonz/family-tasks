# frozen_string_literal: true

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
