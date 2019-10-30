class Api::V1::MoviesController < ApplicationController

  def show
    movie = Movie.find_by_title(params["title"])
    render json: movie
  end

  def index
    movies = Movie.all
    render json: movies
  end

  def create
    movie = Movie.new(movie_params)
    if movie.save
      render json: movie
    else
      render json: {status: "406",
      body: {
        "error": "Unable to create your movie."
        }}
      end
  end

  def update
    movie = Movie.find_by_title(params["title"])
    if movie
      movie.update!(movie_params)
      render json: movie
    else
      render json: {
        "error": "Movie does not exist."
      }
    end
  end

private
  def movie_params
    params.permit(:title, :format, :release_year, :rating, :length)
  end

end
