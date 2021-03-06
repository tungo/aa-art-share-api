class UsersController < ApplicationController

  def index
    if params[:username]
      users = User.where("username LIKE '%#{params[:username]}%'")
      render json: users
    else
      render json: User.all
    end

    # render json: params
    # render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    begin
      user = User.find(params[:id])
      render json: user
    rescue
      render text: 'User id is not exists!!!'
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:username)

  end
end
