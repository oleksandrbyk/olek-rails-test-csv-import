Rails.application.routes.draw do
  resources :uploads, only: :create
  resources :people, only: :create

  root 'welcome#index'
end
