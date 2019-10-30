class Api::V1::UsersController < ApplicationController
  def create
    if user_params["password"] == user_params["password_confirmation"]
      @user = User.new(user_params)
      if @user.save
        render json: {
          message: "Successfully created an account." },
          status: 201
        elsif User.find_by_email(user_params["email"])
          render json: { error: "User already exists."},
            status: 409
        else
          render json: { error: "Bad request."},
          status: 400
        end
      else
        render json: { error: "Passwords must match."},
        status: 409
      end
  end

private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :role, :active)
  end
end
