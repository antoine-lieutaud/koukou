class AddDescriptionToTravels < ActiveRecord::Migration[6.0]
  def change
    add_column :travels, :description, :text
  end
end
