Rails.application.routes.draw do
  root 'routes#show'
  resources :routes, only: [:index, :show]
end
