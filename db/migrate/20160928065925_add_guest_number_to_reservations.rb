class AddGuestNumberToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :guest_number, :integer
  end
end
