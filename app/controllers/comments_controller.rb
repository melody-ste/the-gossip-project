class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create, :edit, :update, :destroy]

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to gossip_path(@gossip), notice: "Commentaire ajouté !"
    else
      redirect_to gossip_path(@gossip), alert: "Erreur lors de l'ajout du commentaire."
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if
      @comment.update(comment_params)
      redirect_to gossip_path(@comment.gossip), notice: "Commentaire modifié !"
    else
      flash.now[:alert] = "Erreur : merci de corriger les champs."
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@comment.gossip), notice: 'Commentaire supprimé avec succès !'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
     redirect_to new_session_path
    end
  end

end
