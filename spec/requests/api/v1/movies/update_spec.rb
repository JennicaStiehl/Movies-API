require 'rails_helper'

RSpec.describe "a user" do
  before :each do
    batman = Movie.create(title: "Batman", format: "DVD", length: 150, release_year: 1997, rating: 5)
  end

  it "can update an existing movie" do
    changed_movie = {length: 156}

    patch "/api/v1/movies/Batman", params: changed_movie
    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    expect(results[:length]).to eq(156)
  end

  it "can error gracefully when the movie isn't in the database" do
    changed_movie = {length: 156}

    patch "/api/v1/movies/Batman3", params: changed_movie
    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)
    expect(results).to eq({
      "error": "Movie does not exist."
      })
  end
end
