require 'rails_helper'

RSpec.describe "a user can see all of the movies" do

  it 'can see all movies' do
    batman = Movie.create(title: "Batman", format: "DVD", length: 150, release_year: 1997, rating: 5)
    batman2 = Movie.create(title: "Batman Returns", format: "DVD", length: 157, release_year: 1999, rating: 3)

    get "/api/v1/movies"

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)
    expect(results[0][:format]).to eq("DVD")
    expect(results[0][:length]).to eq(150)
    expect(results[0][:release_year]).to eq(1997)
    expect(results[0][:rating]).to eq(5)

    expect(results[1][:format]).to eq("DVD")
    expect(results[1][:length]).to eq(157)
    expect(results[1][:release_year]).to eq(1999)
    expect(results[1][:rating]).to eq(3)
  end
end
