class MoviesController < ApplicationController
  def index
    # @movies = [{ title: "My Neighbor Totoro", rating: 5},
    #            { title: "My Happy Family", rating: 0},
    #            { title: "Star Wars: The Last Jedi", rating: 1}]
    @movies = Movie.all
  end
  
  def show
    @result_movie = Movie.find(params[:id])
  end
  
  def new
    @movie = Movie.new
  end
  
  def create
    movie = Movie.create movie_params
    
    unless movie.id == nil
      redirect_to movies_path
    end
  end
  
  def edit
    @movie = Movie.find(params[:id])
  end
  
  def update
    movie = Movie.find(params[:id])

    movie.title = params[:movie][:title]
    movie.rating = params[:movie][:rating]
    movie.genre_id = params[:movie][:genre_id]

    if movie.save
      redirect_to movie_path(movie.id)
    end
  end
  
  def destroy
    Movie.destroy(params[:id])

    redirect_to movies_path
  end
  
  private

  def movie_params
    # params.require(:movie).permit(:title, :rating)
    params.require(:movie).permit(:title, :rating, :genre_id)
  end
end
