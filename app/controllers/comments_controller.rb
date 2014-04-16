class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comment = Comment.all
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.new (params[:comment].permit(:comment))

    if @post.save
      redirect_to '/posts'
     else
      render 'new'
     end   
  end

end
