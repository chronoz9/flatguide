Rails.application.routes.draw do
  namespace :api do
    resources :neighborhoods do
      get :flats, on: :member
    end
    resources :flats do
      member do
        get :users
        get :neighborhood
      end
    end
    resources :users do
      get :flat, on: :member
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
