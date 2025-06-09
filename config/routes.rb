Rails.application.routes.draw do
  root "static_pages#home"
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'

  get '/welcome/:first_name', to: 'welcome#show'
  get '/gossips', to: 'gossips#index'
  get '/gossips/:id', to: 'gossips#show'
  get '/gossips/:id', to: 'gossips#show', as: 'gossip'
  get '/users/:id', to: 'users#show'
end
