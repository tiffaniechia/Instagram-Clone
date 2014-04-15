class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end  

  def show
    @tag = Tag.where(name: '#'+params[:id])

  end

  # def to_param
  #   self.name
  # end

end
