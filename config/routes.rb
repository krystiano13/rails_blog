Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  root "blog_post#index"
  get "posts/:id", to: "blog_post#show"

end
