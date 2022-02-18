class CommentsController < ApplicationController
  def new
    @post = Comment.new
  end

  def create
    post = Post.find(params[:id])
    comment = current_user.comments.new(text: params[:text])
    comment.post = post
    comment.save!
    redirect_to user_post_path
  end
end
