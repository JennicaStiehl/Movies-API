require 'rails_helper'
RSpec.describe "As a registered user", type: :request do
  before :each do
    User.destroy_all
    @user = User.create(id:1, name: "Jill Moss", email: "jill@email.com", active: true, password: "pw", role: "visitor")
  end

  describe "when I enter the correct credientials" do
    it "creates a session" do
      post("/api/v1/sessions?email=#{@user.email}&password=#{@user.password}")

      expect(response.status).to eq(200)
      results = JSON.parse(response.body, symbolize_names: true)
      expect(results[:user_id]).to eq(@user.id)
      expect(results[:name]).to eq(@user.name)
      expect(results[:role]).to eq(@user.role)
    end
  end

  describe "when the wrong password is given" do
    it "fails gracefully" do
      post("/api/v1/sessions?email=#{@user.email}&password=wrong")

      expect(response.status).to eq(403)
      results = JSON.parse(response.body)

      expect(results["error"]).to eq("Incorrect password or email.")
    end
  end

  describe "when the email given is not in the database" do
    it "fails gracefully" do
      post("/api/v1/sessions?email=josh@gmail.com&password=wrong")

      expect(response.status).to eq(403)
      results = JSON.parse(response.body)

      expect(results["error"]).to eq("Please create an account.")
    end
  end
end
