class PlacesController < ApplicationController

  before_action :set_place, only: [:show, :destroy]

  def index
  end
  def show
  end

  def search
    @places = BeermappingApi.places_in(params[:city])
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      render :index
    end
  end

  def set_place
    @place = Place.find(params[:id])
  end

end