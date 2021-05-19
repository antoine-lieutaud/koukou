class Travel < ApplicationRecord
  belongs_to :user
  geocoded_by :arrival
  after_validation :geocode, if: :will_save_change_to_arrival?
end
