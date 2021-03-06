class AvalancheInfosController < ApplicationController
  before_action :current_skier_must_be_avalanche_info_skier, :only => [:edit, :update, :destroy]

  def current_skier_must_be_avalanche_info_skier
    avalanche_info = AvalancheInfo.find(params[:id])

    unless current_skier == avalanche_info.skier
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = AvalancheInfo.ransack(params[:q])
    @avalanche_infos = @q.result(:distinct => true).includes(:skier).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@avalanche_infos.where.not(:location_latitude => nil)) do |avalanche_info, marker|
      marker.lat avalanche_info.location_latitude
      marker.lng avalanche_info.location_longitude
      marker.infowindow "<h5><a href='/avalanche_infos/#{avalanche_info.id}'>#{avalanche_info.created_at}</a></h5><small>#{avalanche_info.location_formatted_address}</small>"
    end

    render("avalanche_infos/index.html.erb")
  end

  def show
    @avalanche_info = AvalancheInfo.find(params[:id])

    render("avalanche_infos/show.html.erb")
  end

  def new
    @avalanche_info = AvalancheInfo.new

    render("avalanche_infos/new.html.erb")
  end

  def create
    @avalanche_info = AvalancheInfo.new

    @avalanche_info.location = params[:location]
    @avalanche_info.skier_id = params[:skier_id]
    @avalanche_info.name = params[:name]
    @avalanche_info.details = params[:details]

    save_status = @avalanche_info.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/avalanche_infos/new", "/create_avalanche_info"
        redirect_to("/avalanche_infos")
      else
        redirect_back(:fallback_location => "/", :notice => "Avalanche info created successfully.")
      end
    else
      render("avalanche_infos/new.html.erb")
    end
  end

  def edit
    @avalanche_info = AvalancheInfo.find(params[:id])

    render("avalanche_infos/edit.html.erb")
  end

  def update
    @avalanche_info = AvalancheInfo.find(params[:id])

    @avalanche_info.location = params[:location]
    @avalanche_info.skier_id = params[:skier_id]
    @avalanche_info.name = params[:name]
    @avalanche_info.details = params[:details]

    save_status = @avalanche_info.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/avalanche_infos/#{@avalanche_info.id}/edit", "/update_avalanche_info"
        redirect_to("/avalanche_infos/#{@avalanche_info.id}", :notice => "Avalanche info updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Avalanche info updated successfully.")
      end
    else
      render("avalanche_infos/edit.html.erb")
    end
  end

  def destroy
    @avalanche_info = AvalancheInfo.find(params[:id])

    @avalanche_info.destroy

    if URI(request.referer).path == "/avalanche_infos/#{@avalanche_info.id}"
      redirect_to("/", :notice => "Avalanche info deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Avalanche info deleted.")
    end
  end
end
