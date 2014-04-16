class PostsController < ApplicationController

before_action :authenticate_user!, only: [:new, :create, :destroy]
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post].permit(:description, :picture, :tag_name))
    @post.user = current_user
    
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
        
  end  

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.delete
    flash[:notice] = 'Post deleted successfully'
    redirect_to '/posts'

    rescue ActiveRecord::RecordNotFound
      flash[:notice] = 'Error! This is not your post'
      redirect_to '/posts'
    end  

  end 


