Ticketee::Application.routes.draw do
  devise_for :users

  get "projects/new"

  resources :projects do
  	resources :tickets
  end

  root to: "projects#index"
end
