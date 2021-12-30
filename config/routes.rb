Rails.application.routes.draw do
  get 'sessions/new'
  root 'routes#show'
  resources :routes, only: [:index, :show]
  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
