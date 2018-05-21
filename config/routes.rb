Rails.application.routes.draw do
  resources :users
  root 'static_pages#index'
  resources :cheeses
  resources :monkeys
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
