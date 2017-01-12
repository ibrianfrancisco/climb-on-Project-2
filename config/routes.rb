Rails.application.routes.draw do
  root "sessions#index"
  resources :users
  resources :posts
  resources :sessions, only: [:new, :create, :destroy, :index]
  get '/login', to: 'sessions#index'
  get '/logout', to: 'sessions#destroy'
end
