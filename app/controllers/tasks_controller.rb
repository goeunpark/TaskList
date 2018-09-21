class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.all.find_by(id: task_id)

    if @task.nil?
      head :not_found
    end

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(action: params[:task][:action], completed_date: params[:task][:completed_date])

    if @task.save
      redirect_to tasks_path
    else
      render :new
  end
end
