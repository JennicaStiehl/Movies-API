class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by_email(user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      session[:name] = @user.name
      session[:role] = @user.role
      render json: session, status: 200
    elsif !@user
      render json: { error: "Please create an account."}, status: 403
    elsif !@user.authenticate(user_params[:password])
      render json: { error: "Incorrect password or email."}, status: 403
    end
  end

private
  def user_params
    params.permit(:email, :password)
  end
end
