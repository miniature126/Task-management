class TasksController < ApplicationController
  before_action :set_user
  
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = @user.tasks.new(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    
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
