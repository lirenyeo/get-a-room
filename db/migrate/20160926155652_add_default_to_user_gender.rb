class AddDefaultToUserGender < ActiveRecord::Migration
  def change
  	change_column_default(:users, :gender, 0)
  end
end
