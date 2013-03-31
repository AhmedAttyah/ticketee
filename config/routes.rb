Ticketee::Application.routes.draw do
  get "projects/new"

  resources :projects do
  	resources :tickets
  end

  root to: "projects#index"
end
