Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :users, only: [:index, :show, :create, :update, :destroy, :new]

  get 'users' => 'users#index'
  post 'users' => 'users#create'
  get 'users/new' => 'users#new', :as => 'new_user'
  get 'users/:id' => 'users#show', :as => 'user'
  patch 'users/:id' => 'users#update'
  put 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'

  resources :artworks, only: [:show, :create, :update, :destroy, :new]

  resources :artwork_shares, only: [:create, :destroy]

  get '/users/:user_id/artworks' => 'artworks#index'

  resources :comments, only: [:index, :create, :destroy]
  get '/users/:user_id/comments' => 'comments#index'
  get '/artworks/:artwork_id/comments' => 'comments#index'
end
