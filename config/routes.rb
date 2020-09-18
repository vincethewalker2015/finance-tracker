Rails.application.routes.draw do

  resources :user_stocks
  get 'users/my_portfolio'
  devise_for :users
  root 'welcome#index'
  get 'welcome/index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'

  get 'chomp', to: 'stocks#chomp'
end
