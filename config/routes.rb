Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        delete "log_out", to: "sessions#destroy"
        get "active", to: "sessions#active_token"
      end

      post "facebook", to: "users#facebook"
      resources :books, only: [:index, :show] do
        resources :reviews, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end
end
