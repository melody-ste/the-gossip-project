class GossipsController < ApplicationController
  def index
    @gossips = Gossip.includes(:user).all
  end

  def show
    @gossip = Gossip.includes(user: :city).find(params[:id])
    @comment = Comment.new
  end

  def new
    @gossip = Gossip.new
  end

  def create
    
    @gossip = Gossip.new(gossip_params)
    

    if @gossip.save 
      redirect_to @gossip, notice: 'Potin créé avec succès !'
    else
      flash.now[:alert] = "Erreur : merci de corriger les champs."
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
   @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to @gossip, notice: 'Potin mis à jour avec succès !'
    else
      flash.now[:alert] = "Erreur : merci de corriger les champs."
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path, notice: 'Potin supprimé avec succès !'
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content, :user_id)
  end

end
