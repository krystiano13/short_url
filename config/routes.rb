Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "main#index"

  get "url/add", to: "url#new", as: :new_url
  get "url/show", to: "url#show_all", as: :url_show_all
  post "url/add", to: "url#create", as: :create_url
end
