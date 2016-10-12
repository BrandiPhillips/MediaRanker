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
    @current = Movie.create(title: params[:movie][:title], author: params[:movie][:author], description: params[:movie][:description], ranked: 0)
  end

  def edit
    @author_type = "Director"
    @current = Movie.find(params[:id].to_i)
  end

  def update
      @current = Movie.find(params[:id].to_i)
      @current.title = params[:movie][:title]
      @current.author = params[:movie][:author]
      @current.description = params[:movie][:description]
      redirect_to movie_path(@current.id)
  end

  def upvote
    @current = Movie.find(params[:id].to_i)
    @current.increment! :ranked
    redirect_to movie_path(@current.id)
  end

  def destroy
    @current = Movie.find(params[:id].to_i).destroy
  end

end
