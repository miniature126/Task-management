class TasksController < ApplicationController
  before_action :set_user
  
  def index
    @tasks = Task.all
  end

  def new
    
  end

  def show
    
  end

  private
    def set_user
      @user = User.find_by(params[:user_id])
    end
end
