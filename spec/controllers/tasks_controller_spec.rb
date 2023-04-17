# frozen_string_literal: true

require 'rails_helper'

describe TasksController, type: :controller do
  let(:member) { create :member }

  describe 'GET #index' do
    subject { get :index }

    let(:tasks) { create_list :task, 10, member: member }

    it 'returns tasks' do
      subject
      expect(assigns(:tasks)).to eq tasks
    end
  end

  describe 'GET #new' do
    subject { get :new }

    it 'returns a task' do
      subject
      expect(assigns(:task)).to be_present
    end
  end

  describe 'POST #create' do
    subject { post :create, params: { task: params } }

    let(:params) { { description: 'cleaning all room', member_id: member.id } }

    context 'with correct params' do
      it 'creates a task' do
        expect { subject }.to change { Task.count }.by 1
      end

      it 'creates a task of the member' do
        expect { subject }.to change { member.tasks.count }.by 1
      end

      it 'redirects to index' do
        subject
        expect(response).to redirect_to action: :index
      end
    end

    context 'with incorrect params' do
      let(:params) { { name: '' } }

      it 'does not create task' do
        expect { subject }.not_to change { Task.count }
      end

      it 'renders new' do
        subject
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    subject { put :update, params: { id: task.id, task: params } }

    let(:task) { create :task }
    let(:params) { { status: 'complete' } }

    it 'updates status to complete' do
      expect { subject }.to change { task.reload.status }.to('complete')
    end

    it 'redirects to index' do
      subject
      expect(response).to redirect_to action: :index
    end
  end
end
