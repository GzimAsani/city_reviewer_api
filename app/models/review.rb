class Review < ApplicationRecord
  belongs_to :city

  validates :title, presence: true
  validates :description, presence: true
  validates :score, presence: true
  validates :city_id, presence: true
end
