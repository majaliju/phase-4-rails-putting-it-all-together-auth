class UsersController < ApplicationController
  skip_before_action 

  def show
  end

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
