class HousesController < ApplicationController
  def show
    @house = House.find(params[:id])
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy
    redirect_to streets_path
  end
end
