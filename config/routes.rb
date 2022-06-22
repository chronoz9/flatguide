Rails.application.routes.draw do
  namespace :api do
    resources :neighborhoods
    resources :flats
    resources :users
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
