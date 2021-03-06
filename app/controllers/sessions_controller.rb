class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_restaurants_path(user.id)
    else
      # redirect_to '/login'
      render plain: "Unable to log in."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
