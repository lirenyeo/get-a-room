class Listing < ActiveRecord::Base
  
  belongs_to :user
  has_many :reservations

  enum place_type: [ "Undefined", "Entire place", "Private room", "Shared room"]

  searchkick match: :word_start, searchable: [:name, :country]

end
