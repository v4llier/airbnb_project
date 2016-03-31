class AddGuestsToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :guests, :integer
  end
end
