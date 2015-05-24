Rails.application.routes.draw do
  get 'items/create'

  devise_for :users
  resources :users, only: [:update, :show] do
    resources :items, only: [:create] 
  end
  root to: 'welcome#index'
end
