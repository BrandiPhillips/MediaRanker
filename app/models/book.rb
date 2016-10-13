class Book < ActiveRecord::Base
  def self.top_ten
    books = Book.all.order(:ranked)
    top = books.reverse.take(10)
    return top
  end
end
