Rails.application.routes.draw do
  root 'static_pages#home'
  get '/lists/:id/new',  to: 'items#new'

  resources :users
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :lists

  resources :items, except: [:new]
  
  
end
