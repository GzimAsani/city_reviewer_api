class Api::V1::ReviewsController < ApplicationController
  



  def create
    @review = city.reviews.new(review_params)

    if @review.save
      render json: ReviewSerializer.new(@review).serialized_json
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])

    if @review.destroy
      head :no_content
    else
      render json: @review.errors, status: :unprocessable_entity
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
end