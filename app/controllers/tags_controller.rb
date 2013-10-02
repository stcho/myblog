class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end
  
  def create
    @post = Post.find(params[:post_id])
    @tag = @post.tags.create(params[:comment].permit(:name))
  end
  
  def destroy
  end
  
  def index
  end

end
