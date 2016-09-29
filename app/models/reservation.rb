class Reservation < ActiveRecord::Base

	belongs_to :listing
	belongs_to :user

	validate :date_validation
	validates :start_date, :end_date, overlap: true
	validates :guest_number, numericality: { greater_than: 0 }

	before_create :get_total_price
	
	# def total_price(price_per_night)
	# 	(end_date.to_date - start_date.to_date).to_i * price_per_night
	# end 

	def date_validation
		if start_date >= end_date
      		errors.add(:end_date, "must be greater than start date")
    	end
    end

    def get_total_price
    	self.total_price = (end_date - start_date).to_i * listing.price
    end

	
end
