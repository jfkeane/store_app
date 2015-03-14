Rails.application.routes.draw do

  devise_for :users
  resources :line_items

  resources :carts

  root 'pages#index'

  get 'index' 	=> 'pages#index' 
  get 'tips'		=> 'pages#tips'
  get 'contact'	=> 'pages#contact'
  get 'about'		=> 'pages#about'
  get 'welcome/index'	=> 'welcome#index'
  get 'products/:productLine'	=> 'products#index'

  resources :products
  


end
