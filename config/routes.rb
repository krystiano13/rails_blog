Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "blog_post#index"
  get "posts/new", to: "blog_post#new", as: :new_post
  get "posts/:id/edit", to: "blog_post#edit", as: :edit_post
  get "posts/:id", to: "blog_post#show", as: :posts
  patch "posts/:id", to: "blog_post#update", as: :patch_post
  post "posts/new/create", to: "blog_post#create", as: :create_post
  delete "posts/:id", to: "blog_post#destroy", as: :delete_post
end
