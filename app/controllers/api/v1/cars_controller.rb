class Api::V1::CarsController < ApplicationController
  def index
    @cars= Car.all
    render json: @cars;
  end

  def new
  end

  def create
  end

  def destroy
  end
end
