Rails.application.routes.draw do
  devise_for :users
  resources :tweets, except: [:destroy, :update, :edit,:show]

  get "/users", to: 'users#index'
  #post 'tweet', to: 'tweets#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get "follow_username", to: 'users#follow_username', as: "follow_username"
  post "follow_username_create", to: 'users#follow_username_create', as: 'follow_username_create'
  get "/followees/:id", to: 'users#followees', as: 'followees'
  get "/followers/:id", to: 'users#followers', as: 'followers'

  resources :followships, only: [:create, :destroy]
  get "/:username", to: "tweets#show", as: "profile"
end
