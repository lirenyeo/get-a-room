class User < ActiveRecord::Base

	
	include Clearance::User

	attr_accessor :password_confirmation

	enum gender: [ 'Not Sure', 'Male', 'Female']

	validates :email, presence: true, uniqueness: true
	# validates :first_name, presence: true
	# validates :last_name, presence: true

	validate :password_confirmation_does_not_match

	has_many :authentications, :dependent => :destroy

	has_many :listings

	has_many :reservations
	
	mount_uploader :avatar, AvatarUploader

	def self.create_with_auth_and_hash(authentication,auth_hash)
		create! do |u|
			u.first_name = auth_hash["info"]["first_name"]
			u.email = auth_hash["extra"]["raw_info"]["email"]
			u.authentications<<(authentication)
		end
	end

	def fb_token
		x = self.authentications.where(:provider => :facebook).first
		return x.token unless x.nil?
	end

	def password_optional?
		true
	end

	def password_confirmation_does_not_match
		if @password != @password_confirmation
			errors.add(:password_confirmation, "Passwords do not match")
		end
	end

	def gender=(val)
    	write_attribute :gender, val.to_s.gsub(/\D/, '').to_i
	end

	def full_name
		first_name + ' ' + last_name
	end

end