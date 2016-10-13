class BooksController < ApplicationController


  def index
    @type = "Books"
    @type_path = "/books/"
    @add_path = new_book_path
    @current = Book.all
  end

  def show
    @view_all_type = book_path
    @type = "Books"
    @edit_path = edit_book_path
    @current = Book.find(params[:id].to_i)
    @author = "Written by: "
  end

  def new
    @author_type = "Author"
    @current = Book.new
  end

  def create
    @current = Book.create
    @current.title = params[:movie][:title]
    @current.author = params[:movie][:author]
    @current.description = params[:movie][:description]
    @current.ranked = 0
    redirect_to movie_path(@current.id)
  end

  def edit
    @author_type = "Author"
    @current = Book.find(params[:id].to_i)
  end

  def update
    @current = Book.find(params[:id].to_i)
    @current.title = params[:book][:title]
    @current.author = params[:book][:author]
    @current.description = params[:book][:description]
    @current.save
    redirect_to movie_path(@current.id)
  end

  def upvote
    @current = Book.find(params[:id].to_i)
    @current.increment! :ranked
    redirect_to book_path(@current.id)
  end

  def destroy
    @current = Book.find(params[:id].to_i).destroy
  end
end
