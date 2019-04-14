Rails.application.routes.draw do

  resources :friendships, only: [:create, :update, :destroy]
  get 'users/show'
  root to: 'welcome#home'
  devise_for :users 
  resources :posts do
    resources :comments
  end
  get 'posts/feed'
end
