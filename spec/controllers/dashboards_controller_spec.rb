# frozen_string_literal: true

require 'rails_helper'

describe DashboardsController, type: :controller do
  let(:members) { create_list(:member, 5)}

  describe 'GET #index' do
    subject { get :index }

    it 'assigns all members' do
      subject
      expect(assigns(:members)).to eq members
    end
  end
end
