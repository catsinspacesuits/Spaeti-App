class Store < ApplicationRecord
	belongs_to :user
	belongs_to :toilet

	validates :name, presence: true
	validates :address, presence: true
	validates :address_line2, presence: true
	validates :address_line3, presence: true
	validates :toilet, presence: true
	# validates :latitude, presence: true
	# validates :longitude, presence: true
	validates :beer_cost, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 10 }
	validates :latitude, :presence => {message: "Not a valid location, please check name address & country fields" }

	def full_address
	  [address, address_line2, address_line3].compact.join(', ')
	end
	
	geocoded_by :full_address
	before_validation :geocode,
	  :if => lambda{ |obj| obj.address_changed? }

	def capitalize_name
		name.capitalize
	end

	def capitalize_address
		address.capitalize
	end
end
