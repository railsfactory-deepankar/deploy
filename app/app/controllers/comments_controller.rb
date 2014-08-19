class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(params[:comment].permit(:commenter,:body))
    redirect_to blog_path(@blog)
  end
  def destroy
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    redirect_to blog_path(@blog)
  end
  def index
    @comments = Comment.find(params[:blog_id])

    redirect_to blog_path(@comments)
  end

end
