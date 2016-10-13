class AllMediaController < ApplicationController
  def index
    # three lists, top 10 of each media type (movies, books, albums).  Lists are generated from the contents of the databases or params since the information will be brought in via forms.  Take a look at Task list...
    @albums = Album.top_ten
    @books = Book.top_ten
    @movies = Movie.top_ten

  end
end
