class Blogger < ApplicationRecord
	has_many :posts
	has_many :destinations, through: :posts

	validates :name, presence: true
	validates :name, uniqueness: true
	validates :bio, length: { in: 0..30}
end
