class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalids

  private

  ## imported this variation from a walkthru; the exceptions passing is new to me
  def handle_invalids(exceptions)
    render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
  end
end
