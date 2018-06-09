Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "avalanche_infos#index"
  # Routes for the Avalanche_info resource:
  # CREATE
  get "/avalanche_infos/new", :controller => "avalanche_infos", :action => "new"
  post "/create_avalanche_info", :controller => "avalanche_infos", :action => "create"

  # READ
  get "/avalanche_infos", :controller => "avalanche_infos", :action => "index"
  get "/avalanche_infos/:id", :controller => "avalanche_infos", :action => "show"

  # UPDATE
  get "/avalanche_infos/:id/edit", :controller => "avalanche_infos", :action => "edit"
  post "/update_avalanche_info/:id", :controller => "avalanche_infos", :action => "update"

  # DELETE
  get "/delete_avalanche_info/:id", :controller => "avalanche_infos", :action => "destroy"
  #------------------------------

  devise_for :skiers
  # Routes for the Skier resource:
  # READ
  get "/skiers", :controller => "skiers", :action => "index"
  get "/skiers/:id", :controller => "skiers", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
