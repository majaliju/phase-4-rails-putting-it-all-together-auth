class UsersController < ApplicationController
  skip_before_action 

  def show
    user = User.find(session[:user_id])
    render json: user
  end

  # ## this alternative method with @current_user as an instance variable is more interesting
  # def show
  #   render json: @current_user
  # end

  def create
    user = User.create!(user_params)
    sessions[:user_id] = user.id
    render json: user, status: :created
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation, :image_url, :bio)
  end
end
