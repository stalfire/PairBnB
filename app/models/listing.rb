class Listing < ApplicationRecord
	belongs_to :user
	has_many :bookings
	mount_uploader :avatar, AvatarUploader

	scope :title, -> (title) { where title: title }
  	scope :country_code, -> (country_code) { where country_code: country_code }
  	scope :max_guests, -> (max_guests) { where max_guests: max_guests}
  	scope :price, -> (price) { where price: price}
  	
end
