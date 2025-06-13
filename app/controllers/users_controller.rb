class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def show
    @user = User.includes(:city, :gossips).find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      remember(@user) if params[:user][:remember_me] == "1"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :description,
      :email,
      :age,
      :password,
      :password_confirmation,
      :city_id,
      :remember_me
    )
  end

end
