class BooksController < ApplicationController


  def index
    @type = "Books"
    @type_path = "book_path(item.id)"
    @add_path = "new_Book_path"
    @current = Book.all
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
    @current = Book.find(params[:id].to_i)
    @current.update(title: params[:book][:title], author: params[:book][:author], description: params[:book][:description])
    redirect_to book_path(@current.id)
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
