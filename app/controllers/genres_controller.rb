class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end
  
  def show
    @result_genre = Genre.find(params[:id])
  end
  
  def new
    @genre = Genre.new
  end
  
  def create
    genre = Genre.create genre_params
    
    unless genre.id == nil
      redirect_to genres_path
    end
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    genre = Genre.find(params[:id])

    genre.name = params[:genre][:name]
  
    if genre.save
      redirect_to genre_path(genre.id)
    end
  end
  
  def destroy
    Genre.destroy(params[:id])

    redirect_to genres_path
  end
  
  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
