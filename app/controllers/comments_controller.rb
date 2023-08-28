class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog
  before_action :set_comment, only: [:destroy]
  
  # POST /blogs/:blog_id/comments
  def create
    @comment = @blog.comments.new(comment_params)
    @comment.user = current_user
   
    if @comment.save
      redirect_to @blog
    else
      redirect_to @blog, alert: 'Failed to create comment.'
    end
  end
  
  # DELETE /blogs/:blog_id/comments/:id
  def destroy
    @comment.destroy
    redirect_to @blog
  end
  
  private
  
  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
  
  def set_comment
    @comment = @blog.comments.find(params[:id])
  end
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
