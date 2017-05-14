class LocationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @locations = current_user.locations.order('created_at DESC')
    location_ids = SharedLocation.where(friend_id: current_user.id).pluck(:location_id)
    @shared_locations = Location.where(id: location_ids).order('created_at DESC')
  end

  def new
    @location = Location.new
  end

  def create
    @location = current_user.locations.build(location_params)
    if @location.save
      params.fetch(:friend_ids, []).each do |friend_id|
        current_user.shared_locations.create(location_id: @location.id, friend_id: friend_id)
      end
      flash[:success] = "Successfully shared location!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @location = Location.find(params[:id])
    @hash = Gmaps4rails.build_markers(@location) do |location, marker|
      marker.lat location.coordinates.longitude
      marker.lng location.coordinates.latitude
      marker.title location.name
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :is_public)
  end
end
