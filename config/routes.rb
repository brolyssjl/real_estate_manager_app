Rails.application.routes.draw do
  root to: 'projects#index'
  devise_for :users
  resources :documents
  resources :projects
end
