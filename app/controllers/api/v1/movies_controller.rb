class Api::V1::MoviesController < ApplicationController

  def show
    movie = Movie.find_by_title(params["title"])
    render json: movie
  end
end
