class MoviesController < ApplicationController

  def index
    @type = "Movie"
    @type_path = "/movies/"
    @add_path = new_movie_path
    @current = Movie.all
  end

  def show
    @view_all_type = movie_path
    @type = "Movies"
    @edit_path = edit_movie_path
    @current = Movie.find(params[:id].to_i)
    @author = "Directed by: "
  end

  def new
    @author_type = "Director"
    @current = Movie.new
  end

  def create
    @current = Movie.create
    @current.title = params[:movie][:title]
    @current.author = params[:movie][:author]
    @current.description = params[:movie][:description]
    @current.ranked = 0
    redirect_to movie_path(@current.id)
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
      @current.save
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
