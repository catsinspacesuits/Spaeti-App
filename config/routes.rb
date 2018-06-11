Rails.application.routes.draw do
  resources :stores
  root 'stores#index'
end
