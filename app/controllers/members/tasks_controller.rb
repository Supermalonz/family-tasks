# frozen_string_literal: true

module Members
  class TasksController < TasksController
    def index
      @tasks = member.tasks
    end

    def update
      if task_by_id.update(update_task_params)
        flash[:success] = 'Finished!'
      else
        flash[:error] = 'Task can not be updated!'
      end
      redirect_to member_tasks_path
    end

    private

    def member
      @member ||= Member.find(params[:member_id])
    end
  end
end
