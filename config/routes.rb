Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :messages, only: [:new, :create]
  end
  resources :rooms, only: [:index, :create, :show] do
    resources :comments, only: [:create]
  end
end
