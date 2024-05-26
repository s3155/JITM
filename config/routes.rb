Rails.application.routes.draw do
  # Devise routes
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    registrations: 'users/registrations' # 追加
  }

  # Other routes
  root 'home#index'

  authenticated :user do
    root to: 'dash_boards#index', as: :authenticated_root
    get 'dash_boards', to: 'dash_boards#index', as: :user_dash_boards
    delete 'logout', to: 'devise/sessions#destroy', as: :logout
  end

  resources :dash_boards, only: [:index]

  # Letter Opener Web
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
