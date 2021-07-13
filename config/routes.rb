Rails.application.routes.draw do
  root to: 'home#index'

  
  resources :categories do
    resources :tasks
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }
  
  devise_scope :user do
    get "/users/sign_in" => "users/sessions#new"
  end


end
