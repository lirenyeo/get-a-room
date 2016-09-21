class User < ActiveRecord::Base
	include Clearance::User

	attr_accessor :password_confirmation

	validates :email, presence: true, uniqueness: true
	validates :first_name, presence: true
	validates :last_name, presence: true

	validate :password_confirmation_does_not_match

	def password_confirmation_does_not_match
		if @password != @password_confirmation
			errors.add(:password_confirmation, "Passwords do not match")
		end
	end

end