Rails.application.routes.draw do
  resources :ingredients
  resources :kitchens
  resources :icons
  resources :recipes
  resources :search_results
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
