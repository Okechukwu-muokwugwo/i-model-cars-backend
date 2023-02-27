class Api::V1::UsersController < ApplicationController
  def create
    @new_user = User.new(
      name: params[:name],
      email: params[:email]
    )

    if @new_user.save
      render json: 'User created successfully!', status: :ok
    else
      render json: 'Failed!', status: :unprocessable_entity
    end
  end

  def show
    if User.exists?(name: params[:user_name])
      @user = User.find_by(name: params[:user_name])
      @resp = { id: @user.id, name: @user.name, email: @user.email }
      render json: @resp, status: :ok
    else
      render json: 'User not found!', status: :not_found
    end
  end
end
