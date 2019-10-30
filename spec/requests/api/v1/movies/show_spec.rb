require 'rails_helper'

RSpec.describe "a user can see the details of a movie" do
  before :each do
  end

  it 'can see a specific movie' do
    batman = Movie.create(title: "Batman", format: "DVD", length: 150, release_year: 1997, rating: 5)

    get "/api/v1/movies/Batman"

    expect(response).to be_successful
    results = JSON.parse(response.body) #, symbolize_name: true
    expect(results["format"]).to eq("DVD")
    expect(results["length"]).to eq(150)
    expect(results["release_year"]).to eq(1997)
    expect(results["rating"]).to eq(5)
  end
end
