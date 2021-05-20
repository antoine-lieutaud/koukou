class Travel < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy
  geocoded_by :arrival
  after_validation :geocode, if: :will_save_change_to_arrival?

end
