Rails.application.routes.draw do

  resources :users, only: [:create, :show, :index]
  resources :requests do
    get :owner_id, to: "requests#new"
  end

  resources :messages
  resources :volunteers

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
