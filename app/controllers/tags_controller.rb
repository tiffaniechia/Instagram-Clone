class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end  

  def show
    @tag = Tag.where(name: '#'+params[:id])

  end 

  def search
    redirect_to "/tags/#{params[:search]}"
  end


end
