class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog
  
  # POST /blogs/:blog_id/comments
  def create
    @comment = @blog.comments.new(comment_params)
    @comment.user = current_user
   
    if @comment.save
      redirect_to @blog
    else
      redirect_to @blog, alert: @comment.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end
  
  private
  
  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
