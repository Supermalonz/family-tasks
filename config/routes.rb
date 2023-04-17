Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "members#index"

  resources :dashboards, only: :index
  resources :members, only: %i[new create]
end
