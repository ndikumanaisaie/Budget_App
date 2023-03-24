Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'categories#index', as: :authenticated_root
    end

    unauthenticated :user do
      root 'users#index', as: :unauthenticated_root
    end
  end

  get 'categories/most_recent'
  get 'categories/most_ancient'

  resources :categories, only: %i[index new create show destroy update] do
    resources :payments, only: %i[index new create destroy update]
  end

  resources :users, only: %i[index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
