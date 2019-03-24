Rails.application.routes.draw do
  
  devise_for :users
	root :to => "root#top"
	root 'user_images#index'
	resources :books
	delete 'books/:id' => 'books#destroy', as: 'destroy_book'

	resources :user_images,only:[:new,:create,:index,:show,:destroy] do
		resource :favorites, only: [:create,:destroy]
	end

	resources :user,only: [:show]

end
