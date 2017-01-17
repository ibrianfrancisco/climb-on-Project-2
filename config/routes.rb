Rails.application.routes.draw do
  root "users#index"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts, except: [:index]
  resources :relationships, only: [:create, :destroy]
  resources :comments, except: [:index, :show]
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'users#index'
end
