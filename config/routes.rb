# == Route Map
#

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :blogs do
    resources :comments, only: [:create, :destroy]
  end

  resources :categories
  resources :tags

  # Defines the root path ("/")
  root "blogs#index"

end
