Rails.application.routes.draw do
  root 'static_pages#home'

  resources :users
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :lists

  get '/lists/:id/new',  to: 'items#new'
  # post '/items/:id',      to: 'items#create' 
  resources :items, except: [:new]
  # resources :items

end
