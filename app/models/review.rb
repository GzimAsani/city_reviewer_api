class Review < ApplicationRecord
  belongs_to :city
  belongs_to :user

  after_commit -> (review) { review.city.calculate_average }
end
