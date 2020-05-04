Rails.application.routes.draw do
  # shorthand for all of the routes that devise needs in order for our application to work
  devise_for :users
  # putting link to home page anywhere in app we can refer to it as root_path
  get "/", to: "pages#home", as: "root"
  get "/listings", to: "listings#index", as: "listings"
  get "listings/new", to: "listings#new", as: "new_listing"
  post "/listings", to: "listings#create"
  # dynamic routes
  get "listings/:id", to: "listings#show", as: "listing"
  get "/listings/:id/edit", to: "listings#edit", as: "edit_listing"
  put "/listings/:id", to: "listings#update"
  patch "/listings/:id", to: "listings#update"
end
