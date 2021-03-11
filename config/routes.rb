Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  #post 'tweet', to: 'tweets#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get "followees", to: 'users#followees'
  get "followers", to: 'users#followers'
  get "users", to: 'users#index'

  resources :followships, only: [:create, :destroy]
end
