# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ["id", "name", "place_type", "property_type", "room_number", "bed_number", "guest_number", "country", "state", "city", "zipcode", "address", "price", "description", "user_id", "created_at", "updated_at"]


# Seed Users

# user = {}
# user['password'] = 'asdf'
# user['password_confirmation'] = 'asdf'

# 20.times do 

# 	user['first_name'] = Faker::Name.first_name 
# 	user['last_name'] = Faker::Name.last_name
# 	user['email'] = Faker::Internet.email
# 	user['gender'] = rand(1..2)
# 	user['phone'] = Faker::PhoneNumber.phone_number
# 	user['country'] = Faker::Address.country
# 	user['birthdate'] = Faker::Date.between(50.years.ago, Date.today)

# 	User.create(user)

# end


# # Seed Listings

listing = {}
uids = []
User.all.each { |u| uids << u.id }

40.times do 

	listing['name'] = Faker::App.name
	listing['place_type'] = rand(1..3)
	listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample

	listing['room_number'] = rand(0..5)
	listing['bed_number'] = rand(1..6)
	listing['guest_number'] = rand(1..10)

	listing['country'] = Faker::Address.country
	listing['state'] = Faker::Address.state
	listing['city'] = Faker::Address.city
	listing['zipcode'] = Faker::Address.zip_code
	listing['address'] = Faker::Address.street_address

	listing['price'] = rand(80..500)
	listing['description'] = Faker::Hipster.sentence

	listing['user_id'] = uids.sample

	Listing.create(listing)

end