class ChangeDepartureDate < ActiveRecord::Migration[6.0]
  def change
    remove_column :travels, :time_flight
    add_column :travels, :time_flight, :date
  end
end
