# frozen_string_literal: true

# Service to login
class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { access_token: token, user: UserSerializer.new(@user) }, status: :ok
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
