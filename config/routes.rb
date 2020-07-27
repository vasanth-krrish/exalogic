Rails.application.routes.draw do

  devise_for :users, skip: :registrations

  root 'users#index'

  resources :users

  resources :basicinfos, except: [:index, :show]
  resources :emergencyinfos, except: [:index, :show]
  resources :skills, except: [:index, :show]
  resources :accinfos, except: [:index, :show]
  resources :departments, except: [:index, :show]

end
