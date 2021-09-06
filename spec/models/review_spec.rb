require 'rails_helper'

RSpec.describe Review, type: :model do
  before(:example) do
      @review = Review.create!(title: 'test_user', description: '123456')
    end
end