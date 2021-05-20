class Travel < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  has_many :bookings, dependent: :destroy
  geocoded_by :arrival
  after_validation :geocode, if: :will_save_change_to_arrival?
  geocoded_by :departure
  after_validation :geocode, if: :will_save_change_to_departure?
end
