class SkiersController < ApplicationController
  def index
    @skiers = Skier.all
  end

  def show
    @skier = Skier.find(params[:id])
  end
end
