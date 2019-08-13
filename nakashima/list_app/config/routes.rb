Rails.application.routes.draw do
  resources :users
  get  '/home',    to: 'static_pages#home'
end
