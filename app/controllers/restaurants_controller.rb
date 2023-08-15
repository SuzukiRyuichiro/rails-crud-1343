class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    # get all the restaurant instances from db
    # assign that to an instance variable to pass it onto the view
    @restaurants = Restaurant.all
  end

  def show; end

  def new
    @restaurant = Restaurant.new
  end

  def create
    strong_params = restaurant_params
    @restaurant = Restaurant.new(strong_params)
    # save the instance to the DB
    @restaurant.save

    redirect_to restaurant_path(@restaurant)
  end

  def edit
    # find the instance of the restaurant we want to edit
    # assign that to an instance variable and pass it onto view
  end

  def update
    # we give the new params to the insatnce
    # we save the changes to the DB
    @restaurant.update(restaurant_params)
    # redirect the user to the show page
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    # destroy method onto that instance
    @restaurant.destroy

    # redirect the user to the index page
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :rating, :address)
  end

  def set_restaurant
    # find the instance with the ID
    @restaurant = Restaurant.find(params[:id])
  end
end
