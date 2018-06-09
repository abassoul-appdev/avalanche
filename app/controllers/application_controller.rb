class ApplicationController < ActionController::Base
  before_action :authenticate_skier!

  protect_from_forgery with: :exception
end
