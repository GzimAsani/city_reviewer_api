class Api::V1::ReviewsController < ApplicationController
  
  protect_from_forgery with: :null_session
  
  def create
      @review = Review.new(review_params)

      if @review.save
        render json: @review, status: :created, location: @review
      else
        render json: @review.errors, status: :unprocessable_entity
      end
    end

  
  def destroy
    @review.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:title, :description, :score, :city_id)
  end
end