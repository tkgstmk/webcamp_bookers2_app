Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about_home'

  resources :books, only: [:index, :create, :edit, :update, :destroy, :show]
  # patch 'books/:id/edit'
  # get '/books' => 'books#index'
  # post '/books' => 'books#create'
  # get '/books/:id/edit' => 'books#edit', as: 'edit_book'
  # patch '/books/:id' => 'books#update', as: 'update_book'
  # delete '/books/:id' => 'books#destroy', as: 'destroy_book'

  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
