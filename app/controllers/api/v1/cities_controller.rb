class Api::V1::CitiesController < ApplicationController
  before_action :set_city, only: [:show, :update, :destroy]



  # GET /cities
  def index
    @cities = City.all

    render json: CitySerializer.new(@cities, options).serialized_json
  end

  # GET /cities/1
  def show
    render json: CitySerializer.new(@city, options).serialized_json
  end

  # POST /cities
  def create
    @city = City.new(city_params)

    if @city.save
      render json: CitySerializer.new(@city).serialized_json
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cities/1
  def update
    if @city.update(city_params)
      render json: CitySerializer.new(@city, options).serialized_json
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cities/1
  def destroy
    @city.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find_by(slug: params[:slug])
    end

    # Only allow a list of trusted parameters through.
    def city_params
      params.require(:city).permit(:name, :image_url, :slug)
    end

    def options
      @options ||= { include: %i[reviews] }
    end
end
