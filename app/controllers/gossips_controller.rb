class GossipsController < ApplicationController
  def index
    @gossips = Gossip.includes(:user).all
  end

  def show
    @gossip = Gossip.includes(user: :city).find(params[:id])
  end
end
