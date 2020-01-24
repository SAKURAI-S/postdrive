Rails.application.routes.draw do
	  root :to => "homes#top"

	  get 'top' => 'lists#show'
	  post 'lists' => 'lists#create'
	  get 'lists/new'

	   


  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'
}
	get 'homes/about' => 'homes#about', as: "about"

	devise_scope :user do
	  # get "user/:id", :to => "users/registrations#detail"
	  get "signup", :to => "users/registrations#new"
	  get "login", :to => "users/sessions#new"
	  get "logout", :to => "users/sessions#destroy"
	  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users, only:[:index, :create, :edit, :show, :update, :destroy]
	resources :lists, only: [:create, :edit, :index, :show, :destroy, :update]
	end
end