class Book < ActiveRecord::Base
  def self.top_ten
    books = Book.all.order(:ranked)
    top = books.take(10)
    return top
  end
end
