class RestaurantsController < ApplicationController
  def index
    # get all the restaurant instances from db
    # assign that to an instance variable to pass it onto the view
    @restaurants = Restaurant.all
  end

  def show
    # get the id in the URL
    id = params[:id]
    # get the instance of the restaurant with the id
    # assign the instance to an instance variable
    @restaurant = Restaurant.find(id)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    strong_params = restaurant_params
    restaurant = Restaurant.new(strong_params)
    # save the instance to the DB
    restaurant.save

    redirect_to restaurant_path(restaurant.id)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :rating, :address)
  end
end
