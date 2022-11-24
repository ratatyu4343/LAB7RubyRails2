class StreetsController < ApplicationController
  def index
    @streets = Street.all
  end

  def show
    @street = Street.find(params[:id])
  end

  def destroy
    
  end
end
