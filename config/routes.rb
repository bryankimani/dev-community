Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  resources :members, only: [:show] do
    collection do
      get "edit_description", to: "members#edit_description", as: :edit_description
      patch "update_description", to: "members#update_description", as: :update_description
      get "edit_personal_details", to: "members#edit_personal_details", as: :edit_personal_details
      patch "update_personal_details", to: "members#update_personal_details", as: :update_personal_details
    end
  end

  resources :work_experiences
end
