Rails.application.routes.draw do
  root "static_pages#home"
  
  resources :static_pages, only: [] do
    collection do
      get :team
      get :contact
    end
  end

  resources :welcome, only: [:show]
  resources :users, only: [:show]
  resources :gossips
end
