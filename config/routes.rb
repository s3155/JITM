Rails.application.routes.draw do
  # Devise routes with custom controllers
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    registrations: 'users/registrations'
  }

  # Routes for authenticated users
  authenticated :user do
    root to: 'users/dash_boards#index', as: :authenticated_root
    # Updated routes to use the users namespace
    get 'dash_boards', to: 'users/dash_boards#index', as: :users_dash_boards
    delete 'logout', to: 'devise/sessions#destroy', as: :logout
  end

  # Other routes
  # Removed duplicate and unnecessary route for dash_boards
  # resources :dash_boards, only: [:index]

  # Letter Opener Web for development environment
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # Devise scope for unauthenticated users
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  # Users namespace
  namespace :users do
    resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    # Corrected users_dash_boards route within users namespace
    resources :dash_boards, only: [:index]
  end
end
