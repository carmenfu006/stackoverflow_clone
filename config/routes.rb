Rails.application.routes.draw do
  root 'users#show'

  devise_for :users

  resources :users, only: [:show]

  resources :questions do
    member do
      post 'upvote'
      post 'downvote' 
    end
    resources :answers do
      post 'vote'
      resources :comments
    end
  end

  resources :bookmarks, only: [:create, :destroy]
  resources :searches, only: [:create, :show]
end
