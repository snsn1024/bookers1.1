Rails.application.routes.draw do
  devise_for :users
	root :to => "root#top"
	resources :books
	delete 'books/:id' => 'books#destroy', as: 'destroy_book'

end
