require 'rails_helper'

RSpec.describe "As a user who is logged on" do
  describe "when I logout" do
    before :each do
      User.destroy_all
      @user = User.create(id:1, name: "Jill Moss", email: "jill@email.com", active: true, password: "pw", role: "visitor")
    end

    it "deletes the session" do
      post("/api/v1/sessions?email=#{@user.email}&password=#{@user.password}")

      delete("/api/v1/sessions/1")

      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:message]).to eq("Successfully logged out.")

    end
  end
end
