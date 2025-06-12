class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:index]

  def index
    @gossips = Gossip.includes(:user).all
  end

  def show
    @gossip = Gossip.includes(user: :city).find(params[:id])
    @comment = Comment.new
  end

  def new
    @gossip = Gossip.new
    @tags = Tag.all
  end

  def create
    
    @gossip = Gossip.new(gossip_params)
    

    if @gossip.save 
       if params[:tag_ids].present?
        tag_ids = params[:tag_ids].reject(&:blank?)  
        @gossip.tags << Tag.where(id: tag_ids)
      end
      redirect_to @gossip, notice: 'Potin créé avec succès !'
    else
      flash.now[:alert] = "Erreur : merci de corriger les champs."
      @tags = Tag.all
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
    @tags =Tag.all
  end

  def update
   @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      if params[:tag_ids].present?
        tag_ids = params[:tag_ids].reject(&:blank?)
        @gossip.tags = Tag.where(id: tag_ids)
      else
        @gossip.tags.clear 
      end
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
