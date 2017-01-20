Rails.application.routes.draw do
  root "users#index"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts, except: [:index], shallow: true do
    resources :comments, only: [:update, :create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  resources :sessions, only: [:index, :new, :create, :destroy]
  get '/login', to: 'users#index'
end
