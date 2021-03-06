class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def archive
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @tags = Tag.all
    @tag = Tag.new
  end
  
  def tag
    @post_tag = PostTag.find(params[:tag_id])
    @post = Post.find(@post_tag.post_id)
    redirect_to @post
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def index
    @posts = Post.order("created_at desc").limit(5)
    @tags = Tag.all
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
    def post_params
      params.require(:post).permit(:title, :text)
    end
    
end
