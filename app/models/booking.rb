class Booking < ApplicationRecord
  belongs_to :travel
  belongs_to :user
  after_create :update_total_bookings
  after_create :update_travel_status

  private

  def update_total_bookings
    total_bookings_updated = self.travel.total_bookings + self.number_of_passengers
    self.travel.update(total_bookings: total_bookings_updated)
  end 

  def update_travel_status
    if self.travel.total_bookings == self.travel.capacity
      self.travel.update(status: "Complet")
    else 
      self.travel.update(status: "Ouvert")
    end
  end

end
