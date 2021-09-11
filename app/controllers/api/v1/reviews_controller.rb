class Api::V1::ReviewsController < ApplicationController
  before_action :authenticate
  def create
    review = current_user.reviews.new(review_params)

    if review.save
      render json: serializer(review)
    else
      render json: errors(review), status: 422
    end
  end

  def destroy
    review = current_user.reviews.find(params[:id])

    if review.destroy
      head :no_content
    else
      render json: errors(review), status: 422
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def city
    @city ||= City.find(params[:city_id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:title, :description, :score, :id, :city_id)
  end

  def serializer(records, options = {})
    ReviewSerializer
      .new(records, options)
      .serialized_json
  end

  def errors(record)
    { errors: record.errors.messages }
  end
end
