Rails.application.routes.draw do
  # Devise routes with custom controllers
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    registrations: 'users/registrations'
  }

  # Routes for authenticated users
  authenticated :user do
    root to: 'dash_boards#index', as: :authenticated_root
    get 'dash_boards', to: 'dash_boards#index', as: :users_dash_boards
    delete 'logout', to: 'devise/sessions#destroy', as: :logout
  end

  # Other routes
  resources :dash_boards, only: [:index]
  
  # Letter Opener Web for development environment
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

# routes.rb

namespace :users do
  resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end




end
