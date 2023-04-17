# frozen_string_literal: true

require 'rails_helper'

describe Members::TasksController, type: :controller do
  let(:member) { create :member }

  describe 'GET #index' do
    subject { get :index, params: params }

    let(:tasks) { create_list(:task, 10, member: member) }
    let(:params) { { member_id: member.id } }

    it 'returns tasks' do
      subject
      expect(assigns(:tasks)).to eq tasks
    end
  end

  describe 'PUT #update' do
    subject { put :update, params: { member_id: member.id, id: task.id, task: params } }

    let(:task) { create :task }
    let(:params) { { status: 'complete' } }

    it 'updates status to complete' do
      expect { subject }.to change { task.reload.status }.to('complete')
    end

    it 'redirects to index' do
      subject
      expect(response).to redirect_to member_tasks_path
    end
  end
end
