Rails.application.routes.draw do

  namespace :admin do
    root 'application#index'
    resources :departaments, only: [:new, :create, :destroy]
    resources :users do
      member do
        patch :archive
      end
    end
  end

  devise_for :users
  root 'departaments#index', :as => 'root_user'

  resources :departaments, only: [:index, :show, :edit, :update] do
    resources :tickets
  end
end
