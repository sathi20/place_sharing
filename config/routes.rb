Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end

  resources :locations
  resources :users, only: [:index, :show]
end
