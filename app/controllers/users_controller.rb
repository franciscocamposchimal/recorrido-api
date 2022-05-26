# frozen_string_literal: true

# Service for handle users
class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: %i[show destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/:id
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.save!
    render json: @user, status: :created
  end

  # DELETE /users/:id
  def destroy
    @user.destroy!
    head :no_content
  end

  private

  # Get one user
  def set_user
    @user = User.find(params[:id])
  end

  # Get params from request
  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end
