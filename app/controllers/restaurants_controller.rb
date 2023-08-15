class RestaurantsController < ApplicationController
  def index
    # get all the restaurant instances from db
    # assign that to an instance variable to pass it onto the view
    @restaurants = Restaurant.all
  end

  def show; end
end
