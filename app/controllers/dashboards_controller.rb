class DashboardsController < ApplicationController
  def show
    @travels = current_user.travels
    @bookings = current_user.bookings
    authorize current_user
  end
end
