require 'rails_helper'
RSpec.describe "as a visitor", type: :request do
  it "I can create a new user in the system" do
    new_user = {
      name: "Jill Moss",
      email: "jill@gmail.com",
      password: "pw",
      password_confirmation: "pw",
      role: "visitor",
      active: true
    }
    post "/api/v1/users", params: new_user

    results = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(201)
    expect(results[:message]).to eq("Successfully created an account.")
  end
end
