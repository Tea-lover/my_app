Rails.application.routes.draw do
  root 'work#index'

  match 'work', to: 'work#index', via: 'get'
  match 'choose_theme', to: 'work#choose_theme', via: :get
  match 'display_theme', to: 'work#display_theme', via: :post, as: :js

  namespace :api, defaults: { format: :json } do
    match 'next_image', to: 'api#next_image', via: :get
    match 'prev_image', to: 'api#prev_image', via: :get
  end

  get 'main/index'
  get 'main/help'
  get 'main/contacts'
  get 'main/about'

  resources :themes
  resources :images
  resources :values
  resources :users
  resources :sessions

  match 'signup',   to: 'users#new',            via: 'get'
  match 'signin',   to: 'sessions#new',         via: 'get'
  match 'signout',  to: 'sessions#destroy',     via: 'delete'
end