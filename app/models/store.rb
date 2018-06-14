class Store < ApplicationRecord

	def full_address
	  [address, address_line2, address_line3].compact.join(', ')
	end
	geocoded_by :full_address
	before_save :geocode,
	  :if => lambda{ |obj| obj.address_changed? }
end
