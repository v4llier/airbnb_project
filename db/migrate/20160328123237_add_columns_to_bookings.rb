class AddColumnsToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :comment, :text
    add_column :bookings, :rating, :integer
  end
end
