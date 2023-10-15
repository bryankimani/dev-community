Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  resources :members, only: [:show] do
    collection do
      get "edit_description(/:id)", to: "members#edit_description", as: :edit_description
      patch "update_description(/:id)", to: "members#update_description", as: :update_description
    end
  end
end
