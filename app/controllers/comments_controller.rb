class CommentsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]
 
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comments_params)
    @comment.user = current_user
    @comment.save
    redirect_to post_path(@post)
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end  
  
  def comments_params
    params.require(:comment).permit(:commenter, :body)
  end
    
end
