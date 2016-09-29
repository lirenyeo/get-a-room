class ChangeReservationsField < ActiveRecord::Migration
  def change
  	change_column_null :reservations, :start_date, false
  	change_column_null :reservations, :end_date, false
  	change_column_null :reservations, :user_id, false
  	change_column_null :reservations, :listing_id, false
  end
end
