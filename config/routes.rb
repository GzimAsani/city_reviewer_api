Rails.application.routes.draw do

  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :cities, param: :slug
      resources :reviews, only: [:create, :destroy, :show, :index]
    end
  end
  get '*path', to: 'pages#index', via: :all  
end
