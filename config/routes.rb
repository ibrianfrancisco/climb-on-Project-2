Rails.application.routes.draw do
  root "users#index"
  resources :users
  resources :posts, except: [:index]
  resources :comments, except: [:index, :show]
  resources :sessions, only: [:create, :destroy]
  get '/login', to: 'users#index'
end
