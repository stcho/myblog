class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end
  
  def create    
    @post = Post.find(params[:post_id])
    @tag = @post.tags.create(tag_params)
    redirect_to post_path(@post)
  end
  
  def destroy
  end
  
  def index
    @tags = Tag.order()
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end
    
end
