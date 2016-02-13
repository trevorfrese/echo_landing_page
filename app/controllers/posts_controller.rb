class PostsController < ApplicationController
  before_action :user_signed_in?, only: [:create, :destroy, :show]

  def show
    @posts = current_user.posts
  end

  def create
    params = post_params
    is_a_reply = post_params[:reply_post]
    if is_a_reply
      parent_post = Post.find(post_params[:parent_post_id])
      params.merge!(lat: parent_post.lat, lng: parent_post.lng, user_id: parent_post.user_id)
      parent_post.increment!(:new_replies)
    end
    params.except!(:reply_post)
    @post = current_user.posts.build(params)
    if @post.save
      flash[:success] = "post created!"
    else
      flash[:error] = "invalid post"
    end
    redirect_to '/map'
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:content, :lat, :lng, :parent_post_id, :reply_post)
    end
end
