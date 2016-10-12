class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @current = Album.find(params[:id].to_i)
  end

  def new
    @author_type = "Artist"
    @current = Album.new
  end

  def create
    @current = Album.update(title: params[:album][:title], author: params[:album][:author], description: params[:album][:description])
  end

  def edit
    @author_type = "Artist"
    @current = Album.find(params[:id].to_i)
  end

  def update
    @current= Album.update(title: params[:album][:title], author: params[:album][:author], description: params[:album][:description])
  end

  def destroy
    @current = Album.find(params[:id].to_i).destroy
  end
end
