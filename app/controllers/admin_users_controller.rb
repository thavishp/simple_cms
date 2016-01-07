class AdminUsersController < ApplicationController
  
  layout "admin"

  before_action :confirm_logged_in

  def index
    @users = AdminUser.sorted
  end

  def new
    @user = AdminUser.new
  end

  def create
    # New User
    @user = AdminUser.new(user_params)

    # Attempt to save user
    if @user.save
      # if success go to index
      flash[:notice] = "User Created Successfully"
      redirect_to(action: 'index')
    else
      # if fail redisplay
      render('new')
    end

  end

  def edit
    @user = AdminUser.find(params[:id])
  end

  def update
    @user = AdminUser.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:notice] = "User Update Successfully"
      redirect_to(action: 'index')
    else
      render('edit')
    end

  end

  def delete
    @user = AdminUser.find(params[:id])
  end

  def destroy
    user = AdminUser.find(params[:id]).destroy
    flash[:notice] = "User '#{user.username}' Deleted Successfully."
    redirect_to(action: 'index')
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end

end
