Rails.application.routes.draw do
  # putting link to home page anywhere in app we can refer to it as root_path
  get "/", to: "pages#home", as: "root"
end
