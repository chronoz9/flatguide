class User < ApplicationRecord
	belongs_to :flat, optional: true
	validates :name, presence: true, length: { minimum: 3 }
	validates :email, uniqueness: true, presence: true
end
