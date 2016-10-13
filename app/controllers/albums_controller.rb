class AlbumsController < ApplicationController

  def index
    @type = "Album"
    @type_path = "/albums/"
    @add_path = new_album_path
    @current = Album.all
  end

  def show
    @view_all_type = album_path
    @type = "Albums"
    @edit_path = edit_album_path
    @current = Album.find(params[:id].to_i)
    @author = "Recorded by: "
  end

  def new
    @author_type = "Artist"
    @current = Album.new
  end

  def create
    @current = Album.create
    @current.title = params[:movie][:title]
    @current.author = params[:movie][:author]
    @current.description = params[:movie][:description]
    @current.ranked = 0
    redirect_to movie_path(@current.id)
  end

  def edit
    @author_type = "Artist"
    @current = Album.find(params[:id].to_i)
  end

  def update
    @current = Album.find(params[:id].to_i)
    @current = Album.find(params[:id].to_i)
    @current.title = params[:album][:title]
    @current.author = params[:album][:author]
    @current.description = params[:album][:description]
    @current.save
    redirect_to movie_path(@current.id)
  end


    def upvote
      @current = Album.find(params[:id].to_i)
      @current.increment! :ranked
      redirect_to album_path(@current.id)
    end


  def destroy
    @current = Album.find(params[:id].to_i).destroy
    redirect_to albums_path
  end
end
