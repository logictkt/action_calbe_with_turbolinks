Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :rooms do
    resources :comments
  end
end
