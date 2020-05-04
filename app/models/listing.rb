class Listing < ApplicationRecord
  belongs_to :user
  # all of these need to be there in order to create a new listing
  validates :title, :description, :price, presence: true
  has_one_attached :picture
end
