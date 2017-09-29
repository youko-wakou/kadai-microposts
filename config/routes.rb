Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      # /users/:id/followings
      get :followings
      # /users/:id/followers(.:format)
      get :followers
    end
   
  end

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end