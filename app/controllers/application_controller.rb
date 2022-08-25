class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalids
  before_action :authorize

  private

  def authorize
    user = User.find_by(id: session[:user_id])
    render json: {errors: 'Not authorized!'}, status: :unauthorized unless session.include? :user_id
  end

  # ## same authorize but with the @current_user instance 
  # def authorize
  #   @current_user = User.find_by(id: session[:user_id])
  #   render json: {errors: 'Not authorized!'}, status: :unauthorized unless @current_user
  # end

  ## imported this variation from a walkthru; the exceptions passing is new to me
  def handle_invalids(exceptions)
    render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
  end
end
