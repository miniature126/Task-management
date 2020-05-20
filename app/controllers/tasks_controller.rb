class TasksController < ApplicationController
  before_action :set_user
  
  def index
    @tasks = Task.all
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
    end
  end

  def show
    
  end
  
  def destroy
    @task = @user.tasks.find(params[:id])
    @task.destroy
    redirect_to user_tasks_url(@user)
  end

  private
    def set_user
      @user = User.find_by(params[:user_id])
    end
    
    # strong parameter
    def task_params
      params.require(:task).permit(:name, :content, :user_id)
    end
end
