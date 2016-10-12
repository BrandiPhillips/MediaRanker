class BooksController < ApplicationController


  def index
    @books = Book.all
  end

  def show
    @current = Book.find(params[:id].to_i)
  end

  def new
    @author_type = "Author"
    @current = Book.new
  end

  def create
    @current = Book.create(title: params[:book][:title], author: params[:book][:author], description: params[:book][:description])
  end

  def edit
    @author_type = "Author"
    @current = Book.find(params[:id].to_i)
  end

  def update
    @current = Book.update(title: params[:book][:title], author: params[:book][:author], description: params[:book][:description])
  end

  def destroy
    @current = Book.find(params[:id].to_i).destroy
  end
end
