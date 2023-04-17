# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.includes(:member)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(create_task_params)

    if @task.save
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if task_by_id.update(update_task_params)
      flash[:success] = 'Completed!'
    else
      flash[:error] = 'Error!'
    end
    redirect_to action: :index
  end

  private

  def create_task_params
    params.require(:task).permit(:description, :member_id)
  end

  def update_task_params
    params.require(:task).permit(:status)
  end

  def task_by_id
    @task_by_id || Task.find(params[:id])
  end
end
