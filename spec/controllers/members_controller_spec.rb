# frozen_string_literal: true

require 'rails_helper'

describe MembersController, type: :controller do
  describe 'GET #new' do
    subject { get :new }

    it 'renders the new template' do
      subject
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    subject { post :create, params: params }

    let(:params) do
      {
        member: { name: 'John the 1' }
      }
    end

    context 'with a correct params' do
      it 'creates a member' do
        expect { subject }.to change { Member.count }.by 1
      end

      it 'redirects to index' do
        subject
        expect(response).to redirect_to dashboards_path
      end

      it 'return flashes messages' do
        subject
        expect(flash[:success]).to eq 'Created a member!'
      end
    end

    context 'with incorrect params' do
      let(:params) do
        {
          member: { name: '' }
        }
      end

      it 'does not create a member' do
        expect { subject }.not_to change { Member.count }
      end

      it 'renders new path' do
        subject
        expect(subject).to render_template('new')
      end
    end
  end
end
