class Api::GenresController < ApplicationController
  def index
    @genres = Genre.all
    
    genres = Genre.all.as_json(
      only: [:id, :name],
      methods: :movies_in_this_genre
    )
    
    render json: genres, status: :ok
  end
  
  def show
    result_genre = Genre.find_by(id: params[:id])
  
    if result_genre
      render json: result_genre.as_json(
      ), status: :ok
    else
      render json: { nothing: true }, status: :not_found
    end
  end
  
  def new
    @genre = Genre.new
  end
  
  def create
    genre = Genre.create genre_params
    
    if genre.save
      render status: :ok, json: { id: genre.id }
    else
      render status: :bad_request, json: { errors: genre.errors.messages }
    end
  end
  
  # def edit
  #   @genre = Genre.find(params[:id])
  # end
  # 
  # def update
  #   genre = Genre.find(params[:id])
  # 
  #   genre.name = params[:genre][:name]
  # 
  #   if genre.save
  #     redirect_to genre_path(genre.id)
  #   end
  # end
  # 
  # def destroy
  #   Genre.destroy(params[:id])
  # 
  #   redirect_to genres_path
  # end
  
  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
