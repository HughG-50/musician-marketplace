Rails.application.routes.draw do
  # shorthand for all of the routes that devise needs in order for our application to work
  devise_for :users
  # putting link to home page anywhere in app we can refer to it as root_path
  get "/", to: "pages#home", as: "root"
end
