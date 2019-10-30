require 'rails_helper'

RSpec.describe "a user can create a new movie record" do
  it "can successfully make a new movie" do
    new_movie = {
      title: "Deadpool",
      format: "Streaming",
      length: 168,
      release_year: 2016,
      rating: 4
    }
    post "/api/v1/movies", params: new_movie

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)
    movie = Movie.last

    expect(movie[:title]).to eq("Deadpool")
    expect(movie[:format]).to eq("Streaming")
    expect(movie[:length]).to eq(168)
    expect(movie[:release_year]).to eq(2016)
    expect(movie[:rating]).to eq(4)
  end

  it "can error gracefully" do
    new_movie = {
      title: nil,
      format: "Streaming",
      length: 168,
      release_year: 2016,
      rating: 4
    }
    post "/api/v1/movies", params: new_movie

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)
    movie = Movie.last

    expect(movie).to eq(nil)
    expect(JSON.parse(response.body)).to eq(
      {"status" => "406",
        "body" => {
          "error" => "Unable to create your movie."
        }
      }
    )
  end
end
