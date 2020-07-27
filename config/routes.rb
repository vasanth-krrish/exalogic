Rails.application.routes.draw do

  devise_for :users, skip: :registrations

  root 'users#index'

  resources :users

  resources :basicinfos, only: [:create, :update, :destroy]
  resources :emergencyinfos, only: [:create, :update, :destroy]
  resources :skills, only: [:create, :update, :destroy]
  resources :accinfos, only: [:create, :update, :destroy]
  resources :departments, only: [:create, :update, :destroy]

end
