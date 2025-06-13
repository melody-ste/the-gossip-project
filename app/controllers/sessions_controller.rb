class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      log_in(user)

      if params[:remember_me] == "1"
        remember(user)
      else
        forget(user)
      end

      flash[:success] = "Bienvenue #{user.first_name} !"
      redirect_to root_path
    else
      flash.now[:danger] = 'Email ou mot de passe invalide'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    flash[:success] = "Déconnexion réussie"
    redirect_to root_path
  end
end
