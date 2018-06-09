class SkiersController < ApplicationController
  def index
    @skiers = Skier.all
    @location_hash = Gmaps4rails.build_markers(@skiers.where.not(:home_mountain_latitude => nil)) do |skier, marker|
      marker.lat skier.home_mountain_latitude
      marker.lng skier.home_mountain_longitude
      marker.infowindow "<h5><a href='/skiers/#{skier.id}'>#{skier.email}</a></h5><small>#{skier.home_mountain_formatted_address}</small>"
    end
  end

  def show
    @skier = Skier.find(params[:id])
  end
end
