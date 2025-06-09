class UsersController < ApplicationController
  def show
    @user = User.includes(:city, :gossips).find(params[:id])
  end
end
