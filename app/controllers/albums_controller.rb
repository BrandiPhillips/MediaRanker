class AlbumsController < ApplicationController

  def index
    @type = "Album"
    @type_path = "/albums/"
    @add_path = new_album_path
    @current = Album.all
  end

  def show
    @current = Album.find(params[:id].to_i)
  end

  def new
    @author_type = "Artist"
    @current = Album.new
  end

  def create
    @current = Album.create(title: params[:album][:title], author: params[:album][:author], description: params[:album][:description], ranked: 0)
    redirect_to album_path(@current.id)
  end

  def edit
    @author_type = "Artist"
    @current = Album.find(params[:id].to_i)
  end

  def update
    @current = Album.find(params[:id].to_i)
      @current.update(title: params[:album][:title], author: params[:album][:author], description: params[:album][:description], ranked: 0)
      redirect_to album_path(@current.id)
  end


    def upvote
      @current = Album.find(params[:id].to_i)
      @current.increment! :ranked
      redirect_to album_path(@current.id)
    end


  def destroy
    @current = Album.find(params[:id].to_i).destroy
  end
end
