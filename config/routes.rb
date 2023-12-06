Rails.application.routes.draw do
  # resources :registrations, only: [:index, :new, :create]
  resources :tasks
  
  get "/login" => 'logins#new', as: "login"
  post "/login" => 'logins#create'
  delete "/logout" => 'logins#delete'
  get "/registration" => "registrations#new", as: "new_user"
  post "/registration" => "registrations#create", as: "create"
  root "logins#new"
end
