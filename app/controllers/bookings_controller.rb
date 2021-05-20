class BookingsController < ApplicationController
  before_action :set_travel, only: %i[edit update destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Travel.find(params[:id])
    authorize @booking
  end
    
  def new
    @booking = Booking.new
    @travel = Travel.find(params[:travel_id])
    authorize @booking
  end
  
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @travel = Travel.find(params[:travel_id])
    @booking.travel = @travel
    begin
      authorize @booking
    rescue Pundit::NotAuthorizedError
      flash[:alert] = "Désolé, quelqu'un vient de réserver la dernière place disponible"
    end
    @booking.save!
    redirect_to confirmation_path(@booking)
  end

  def confirmation
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:number_of_passengers)
  end
end
