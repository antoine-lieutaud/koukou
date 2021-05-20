class DashboardsController < ApplicationController
  def show
    @travels = current_user.travels
    authorize current_user
  end
end
