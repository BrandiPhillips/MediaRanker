class Movie < ActiveRecord::Base
  def self.top_ten
    movies = Movie.all.order(:ranked)
    top = movies.reverse.take(10)
    return top
  end
end
