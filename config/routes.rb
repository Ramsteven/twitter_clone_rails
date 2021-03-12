Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  #post 'tweet', to: 'tweets#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  #get "follow_username", to: 'users#follow_username'
  #post "follow_username_create", to: 'users#follow_username'
  get "/followees/:id", to: 'users#followees', as: 'followees'
  get "/followers/:id", to: 'users#followers', as: 'followers'
  get "users", to: 'users#index'

  resources :followships, only: [:create, :destroy]
end
