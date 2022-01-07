Rails.application.routes.draw do
  root "routes#top"
  resources :routes
  resources :users, except: [:index]
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  get '/search',  to: 'routes#search'
end