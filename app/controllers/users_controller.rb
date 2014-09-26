class UsersController < ApplicationController
  
  def index
    @user = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      flash[:success] = "success! created user #{@user.name}"
    else
      flash.now[:alert] = "error: #{@user.errors.full_messages}"
      render 'new'
    end
 #   render plain: params[:user].inspect
  end
  
  def show
    @user = User.find(params[:id])
    @gallery = @user.galleries
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
    flash[:success] = "#{@user.name} deleted"
  end
  
  private
  def user_params
    params.require(:user).permit(:name)
  end
end
