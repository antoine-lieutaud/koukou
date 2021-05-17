class CreateTravels < ActiveRecord::Migration[6.0]
  def change
    create_table :travels do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :time_flight
      t.string :departure
      t.string :arrival
      t.integer :price
      t.integer :capacity
      t.string :status

      t.timestamps
    end
  end
end
