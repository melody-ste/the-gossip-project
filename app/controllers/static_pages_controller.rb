class StaticPagesController < ApplicationController
  def team
  end

  def contact
  end

  def home
    @gossips = Gossip.includes(:user)
  end
end
