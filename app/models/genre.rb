class Genre < ApplicationRecord
  has_many :movies
  
  def movies_in_this_genre
    self.movies
  end
end
