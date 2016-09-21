class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      
      t.integer :place_type
      t.string :property_type

      t.integer :room_number
      t.integer :bed_number
      t.integer :guest_number

      t.string :country
      t.string :state
      t.string :city
      t.string :zipcode
      t.string :address

      t.integer :price
      t.text :description

      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
