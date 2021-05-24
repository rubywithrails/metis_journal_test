Rails.application.routes.draw do
  devise_for :users
  resources :journals
  root to: 'journals#index'
end
