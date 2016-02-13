class MapController < ApplicationController
  before_action :user_signed_in?, only: [:show, :create, :upvote]

  def show
  end

  def upvote
    @post = Post.find(params[:id])
    if @post.votes.find_by_user_id(current_user.id) == nil
      @post.votes.create(user_id: current_user.id)
      @post.save
      flash[:notice] =  "Thank you for upvoting!"
    else
      @post.votes.find_by_user_id(current_user.id).destroy
      @post.save
      flash[:notice] =  "You have removed your upvote"
    end
    redirect_to '/map'
  end
  
end