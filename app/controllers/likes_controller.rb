class LikesController < ApplicationController
 before_action :authenticate_user

 def create
    @likeable = find_likeable
    @like = @likeable.likes.build(user: current_user)
    if @like.save
      redirect_back fallback_location: root_path
    else
      redirect_back fallback_location: root_path, alert: "Impossible de mettre un like."
    end
  end

  def destroy
    @likeable = find_likeable
    @like = @likeable.likes.find_by(user: current_user)
    if @like
      @like.destroy
    else
      redirect_back fallback_location: root_path, alert: "Like introuvable."
    end
  end



  private

  def find_likeable
    if params[:gossip_id]
      Gossip.find(params[:gossip_id])
    elsif params[:comment_id]
      Comment.find(params[:comment_id])
    else
      nil
    end
  end


  def authenticate_user
  unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
