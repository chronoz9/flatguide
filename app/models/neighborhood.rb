class Neighborhood < ApplicationRecord
	validates :name, presence: true
	validates :latitude, presence: true, numericality: true
	validates :longitude, presence: true, numericality: true
	validates :radius, presence: true, numericality: true
	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode

	def flats
		Flat.near(self.to_coordinates, self.radius, units: :km)
	end

end
