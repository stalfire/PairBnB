Rails.application.routes.draw do
  get 'braintree/new'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :edit, :update] do
    resource :password, controller: "clearance/passwords", only: [:create, :edit, :update]
  end
  resources :listings do
    resources :bookings, only: [:create, :new]
  end
  resources :bookings, only: [:show, :destroy]

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/listing/search" => "listings#search_listings", as: "search"
  get "/listing/search_result" => "listings#search_result", as: "search_result"

    post 'braintree/checkout'
    root 'welcome#index'
    get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end

