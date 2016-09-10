class RidesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @attraction = Attraction.find(params[:attraction_id])
    if @user.height < @attraction.min_height && @user.tickets < @attraction.tickets
      flash[:alert] = "You are not tall enough to ride the #{@attraction.name}. You do not have enough tickets the #{@attraction.name}"
    elsif @user.tickets < @attraction.tickets
      flash[:alert] = "You do not have enough tickets the #{@attraction.name}"
    elsif @user.height < @attraction.min_height
      flash[:alert] = "You are not tall enough to ride the #{@attraction.name}"
    else
      @user.tickets -= @attraction.tickets
      @user.happiness =+ @attraction.happiness_rating
      @user.save
      flash[:alert] = "Thanks for riding the #{@attraction.name}!"
    end
    redirect_to @user
  end
end
