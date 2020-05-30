class TasksController < ApplicationController
  before_action :set_task_user
  
  def index
    @tasks = Task.where(user_id: params[:user_id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url(@user)
    else
      render :new
    end
  end
  
  def edit
    @task = @user.tasks.find(params[:id])
  end
  
  def update
    @task = @user.tasks.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_tasks_url(@user)
    else
      render :edit
    end
  end

  def show
    @task = @user.tasks.find(params[:id])
  end
  
  def destroy
    @task = @user.tasks.find(params[:id])
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_url(@user)
  end

  private
    def set_task_user
      @user = User.find(params[:user_id])
    end
    
    # strong parameter
    def task_params
      params.require(:task).permit(:name, :content, :user_id)
    end
end
