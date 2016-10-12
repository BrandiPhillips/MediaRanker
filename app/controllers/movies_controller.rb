class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @current = Movie.find(params[:id].to_i)
  end

  def new
    @author_type = "Director"
    @current = Movie.new
  end

  def create
    @current = Movie.create(title: params[:movie][:title], author: params[:movie][:author], description: params[:movie][:description])
  end

  def edit
    @author_type = "Director"
    @current = Movie.find(params[:id].to_i)
  end

  def update
        @current = Movie.update(title: params[:movie][:title], author: params[:movie][:author], description: params[:movie][:description])
  end

  def destroy
    @current = Movie.find(params[:id].to_i).destroy
  end
end
