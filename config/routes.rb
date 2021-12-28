Rails.application.routes.draw do
  get 'routes/index'
  get 'routes/show'
  resources :routes, only: [:index, :show]
end
