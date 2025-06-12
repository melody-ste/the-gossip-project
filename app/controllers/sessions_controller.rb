class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      log_in(user)
      flash[:success] = "Bienvenue #{user.first_name} !"
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Déconnexion réussie"
    redirect_to root_path
  end
end
