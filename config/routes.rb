Rails.application.routes.draw do
  root 'welcome#index'

  get '/about', to: 'about#index'
  get '/contact', to: 'contact#index'

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:new, :edit, :create]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
end
