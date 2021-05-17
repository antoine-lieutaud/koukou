class TravelsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  
  def index
    @travels = Travel.all
  end

  def show
    @travel = Travel.find(params[:id])
  end

  def new
    @travel = Travel.new
  end

  def create
    @travel = Travel.new(travel_params)
    @travel.user = current_user
    @travel.save

    redirect_to travels_path
  end

  def edit
    @travel = Travel.find(params[:id])
  end

  def update
    @travel = Travel.find(params[:id])
    @travel.update(travel_params)

    redirect_to travel_path(@travel)
  end

  def destroy
    @travel = Travel.find(params[:id])
    @travel.destroy
  end

  private

    def travel_params
      params.require(:travel).permit(:time_flight, :departure, :arrival, :price, :capacity, :status)
    end




end
