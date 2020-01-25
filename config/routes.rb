Rails.application.routes.draw do
	  root :to => "homes#top"
	  get 'lists/new'
	  # get 'top' => 'lists#show'
	  # post 'lists' => 'lists#create'
	  get 'lists' => 'lists#index'

 	get 'lists/:id' => 'lists#show', as: 'list'
 	post 'lists' => 'lists#create'
    get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
    patch 'lists/:id' => 'lists#update', as: 'update_list'
    delete 'lists/:id' => 'lists#destroy', as: 'destroy_list'

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
	resources :lists, only: [:create, :edit, :index, :show, :update, :destroy]
	end
end