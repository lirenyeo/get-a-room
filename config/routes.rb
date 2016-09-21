Rails.application.routes.draw do
  
  root 'static#home'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  

  # redirect everything else to root
  # constraints is really not needed here, just leave it for reference
  get '*other_paths', :constraints => { :other_paths => /.*/ }, to: redirect('/')


end
