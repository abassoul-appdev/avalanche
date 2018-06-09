Rails.application.routes.draw do
  devise_for :skiers
  # Routes for the Skier resource:
  # READ
  get "/skiers", :controller => "skiers", :action => "index"
  get "/skiers/:id", :controller => "skiers", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
