Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'welcome#index'

  get '/about', to: 'about#index'
  get '/contact', to: 'contact#index'

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:new, :edit, :create]
  resources :password_resets, only: [:new, :create, :update, :edit]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
end
