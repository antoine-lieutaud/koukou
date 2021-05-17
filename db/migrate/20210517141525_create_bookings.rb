class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :travel, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :number_of_passengers

      t.timestamps
    end
  end
end
