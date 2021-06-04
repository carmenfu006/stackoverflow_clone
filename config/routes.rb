Rails.application.routes.draw do
  root 'users#show'

  devise_for :users

  resources :users, only: [:show]
  resources :questions do
    member do
      post 'upvote'
      post 'downvote' 
    end
  end
end
