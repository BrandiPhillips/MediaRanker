class Album < ActiveRecord::Base

  def self.top_ten
    albums = Album.all.order(:ranked)
    top = albums.reverse.take(10)
    return top
  end

end
