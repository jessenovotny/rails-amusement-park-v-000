class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      login(@user)
      redirect_to user_path(@user)
    else
      render :new, notice: 'Login unsuccessful.'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
