Rails.application.routes.draw do
  get "/dogs" => "dogs#index"
  post "/dogs" => "dogs#create"

  ### USER LOGIN ROUTES
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
end
