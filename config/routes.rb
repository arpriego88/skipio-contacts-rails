Rails.application.routes.draw do

  root 'contacts#index'

  resources :contacts, only: :index do
    resources :messages, only: [:new, :create]
  end
end
