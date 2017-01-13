Rails.application.routes.draw do
  root "users#index"
  resources :users
  resources :posts, except: [:index]
  resources :sessions, only: [:create, :destroy]
  get '/login', to: 'users#index'
end
