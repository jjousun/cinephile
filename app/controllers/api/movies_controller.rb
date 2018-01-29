class Api::MoviesController < ApplicationController
  def index
    data = Movie.all
    
    render status: :ok, json: data
  end
  
  def show
    movie = Movie.find_by(title: params[:title])

    if movie
      render json: movie.as_json(
        only: [:id, :title, :rating, :genre_id]
      ), status: :ok
    else
      render json: { errors: { title: ["Movie '#{params[:title]}' not found"]} }, status: :not_found
    end
  end
  
  def new
    @movie = Movie.new
  end
  
  def create
    movie = Movie.create movie_params
      
    if movie.save
      render status: :ok, json: {id: movie.id, title: movie.title, rating: movie.rating, genre_id: movie.genre_id}
    else
      render status: :bad_request, json: { errors: movie.errors.messages }
    end
  end
  
  # def edit
  #   @movie = Movie.find(params[:id])
  # end
  # 
  # def update
  #   movie = Movie.find(params[:id])
  # 
  #   movie.title = params[:movie][:title]
  #   movie.rating = params[:movie][:rating]
  #   movie.genre_id = params[:movie][:genre_id]
  # 
  #   if movie.save
  #     redirect_to movie_path(movie.id)
  #   end
  # end
  # 
  # def destroy
  #   Movie.destroy(params[:id])
  # 
  #   redirect_to movies_path
  # end
  
  private

  def movie_params
    params.require(:movie).permit(:title, :rating, :genre_id)
  end
end
