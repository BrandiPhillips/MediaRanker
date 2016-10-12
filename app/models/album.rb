class Album < ActiveRecord::Base

  def self.top_ten
    albums = Album.all.order(:ranked)
    top = albums.take(10)
    return top
  end

end
