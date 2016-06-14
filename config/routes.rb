Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root 'posts#index'
  get 'page/:number' => 'posts#pager', as: 'pager'

  resources :posts, only: [:show] do
    resources :comments, only: [:create]
  end

  get 'about' => 'about#index'

  get 'contact', to: 'contact#new', as: 'contact'
  post 'contact', to: 'contact#create'
end
