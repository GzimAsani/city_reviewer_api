class Api::V1::CitiesController < ApplicationController
  before_action :set_city, only: %i[show update destroy]
  before_action :authenticate, only: %i[create update destroy]

  # GET /cities
  def index
    render json: serializer(cities, options)
  end

  # GET /cities/1
  def show
    render json: serializer(city, options)
  end

  # POST /cities
  def create
    @city = City.new(city_params)

    if @city.save
      render json: serializer(city)
    else
      render json: errors(city), status: 422
    end
  end

  # PATCH/PUT /cities/1
  def update
    city = City.find_by(slug: params[:slug])

    if city.update(city_params)
      render json: serializer(city, options)
    else
      render json: errors(city), status: 422
    end
  end
  # DELETE /cities/1
  def destroy
    if city.destroy
      head :no_content
    else
      render json: errors(city), status: 422
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_city
    @city = City.find_by(slug: params[:slug])
  end

  def cities
    @cities ||= City.includes(reviews: :user).all
  end

  def city
    @city ||= City.includes(reviews: :user).find_by(slug: params[:slug])
  end

  # Only allow a list of trusted parameters through.
  def city_params
    params.require(:city).permit(:name, :image_url, :slug)
  end

  def options
    @options ||= { include: %i[reviews] }
  end

  def serializer(records, options = {})
    CitySerializer
      .new(records, options)
      .serialized_json
  end
  
    # Errors
  def errors(record)
    { errors: record.errors.messages }
  end
end
