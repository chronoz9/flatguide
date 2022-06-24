class Flat < ApplicationRecord
	has_many :users
	validates :name, presence: true
	validates :latitude, presence: true, numericality: true
	validates :longitude, presence: true, numericality: true
	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode


	def neighborhood
		neighborhood = Neighborhood.near(self.to_coordinates, :radius, units: :km)
	end
end
