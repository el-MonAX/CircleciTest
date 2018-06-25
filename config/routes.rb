# frozen_string_literal: true

#
Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_for :admin
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'home#index'
  get  'catalog',            to: 'books#index'
  get  'settings/addresses', to: 'addresses#index'
  post 'settings/addresses', to: 'addresses#create'
  put  'settings/addresses', to: 'addresses#update'
  get  'settings/privacy',   to: 'users#edit'

  resources :books, only: %i[index show update] do
    resources :reviews, only: :create
  end

  resource  :cart, only: %i[show update]
  resources :checkout
  resources :credit_card
  resources :orders, only: %i[index show]
  resources :order_items, only: %i[create update destroy]
  resource :admin

  resource :user, only: %i[edit] do
    collection do
      patch 'update_email'
      patch 'update_password'
    end
  end
end
