Rails.application.routes.draw do
  devise_for :users
  resources :stores
  root 'stores#index'
end
