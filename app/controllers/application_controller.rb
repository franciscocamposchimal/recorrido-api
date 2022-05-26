# frozen_string_literal: true

# Main controller
class ApplicationController < ActionController::API
  include ::ActionController::Serialization
  include JsonWebToken

  before_action :authenticate_request

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordNotDestroyed, with: :unprocessable_entity_response
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response

  private

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end

  def record_not_found(exception)
    render json: { error: exception.message }, status: 404
  end

  def unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end
