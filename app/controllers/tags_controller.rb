class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end
  
  def create    
    @post = Post.find(params[:post_id])
    @tag = @post.tags.create(tag_params)
    redirect_to post_path(@post)
    
    #search all the tags in the system, is there a tag with this name?
    # if tag not found create a new tag if found use that tag
    # make a new post_tag objet that has the tag and post
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @tag = @post.tags.find(params[:id])
    @tag.destroy
    redirect_to post_path(@post)
  end
  
  def index
    @tags = Tag.order("name")
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end
    
end
