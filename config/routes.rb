Rails.application.routes.draw do
  
  devise_for :users
	root :to => "root#top"
	root 'user_images#index'
	resources :books
	delete 'books/:id' => 'books#destroy', as: 'destroy_book'
	resources :user,only: [:show, :index]
end

