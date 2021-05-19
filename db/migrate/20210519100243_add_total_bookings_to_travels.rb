class AddTotalBookingsToTravels < ActiveRecord::Migration[6.0]
  def change
    add_column :travels, :total_bookings, :integer, default: 0
  end
end
