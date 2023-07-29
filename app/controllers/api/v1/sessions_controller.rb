class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.valid_password?(params[:password])
      render json: @user.as_json(only: [:id, :email, :authentication_token]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
    
  end

  private
  
  def find_user
    @user = User.where(id: params[:email]).first
  end
end