class TravelsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_travel, only: %i[edit update destroy]

  def index
    if params[:query].present?
      sql_query = " \
        travels.departure @@ :query \
        OR travels.arrival @@ :query
      "
      @travels = policy_scope(Travel).where(sql_query, query: "%#{params[:query]}%")
    else
      @travels = policy_scope(Travel)
    end

    @markers = @travels.geocoded.map do |travel|
      {
        lat: travel.latitude,
        lng: travel.longitude
      }
    end
  end

  def show
    @travel = Travel.find(params[:id])
    authorize @travel
    arrival = Geocoder.search(@travel.arrival).first.coordinates
    departure = Geocoder.search(@travel.departure).first.coordinates
    @markers = [{
        lat: arrival[0],
        lng: arrival[1]
      },
      {
        lat: departure[0],
        lng: departure[1]
      }
    ]
  end

  def new
    @travel = Travel.new
    authorize @travel
  end

  def create
    @travel = Travel.new(travel_params)
    @travel.user = current_user
    @travel.save
    authorize @travel
    redirect_to travels_path
  end

  def edit
    @travel = Travel.find(params[:id])
    authorize @travel
  end

  def update
    @travel = Travel.find(params[:id])
    @travel.update(travel_params)

    redirect_to travel_path(@travel)
  end

  def destroy
    @travel = Travel.find(params[:id])
    @travel.destroy
    redirect_to dashboard_path
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
    authorize(@travel)
  end

  def travel_params
    params.require(:travel).permit(:time_flight, :departure, :arrival, :price, :capacity, :status, :description, :photo)
  end

end
