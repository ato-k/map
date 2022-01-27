Rails.application.routes.draw do
  root "routes#top"

  get '/routes/search',  to: 'routes#search'

  resources :routes
  resources :users, except: [:index]
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  get '/message', to: 'users#message'
  post '/message', to: 'users#message_create'

end