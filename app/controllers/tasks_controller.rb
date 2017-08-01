class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all # GET /tasks
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task)
  end

  def edit
    # GET /tasks/:id/edit
  end

  def update
    @task.update(task_params) # PATCH /tasks/:id

    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy # UPDATE /tasks/:id

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
