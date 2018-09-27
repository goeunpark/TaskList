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

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)

    redirect_to task_path(task.id)
  end

  def destroy
    task = Task.find_by(id: params[:id])

    task.destroy
    redirect_to tasks_path
  end

  def task_params
    return params.require(:task).permit(
      :action,
      :completed_date
    )
  end
end
