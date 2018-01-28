class MoviesController < ApplicationController
  def index
    @movies = [{ title: "My Neighbor Totoro", rating: 5},
               { title: "My Happy Family", rating: 0},
               { title: "Star Wars: The Last Jedi", rating: 1}]
  end
end
