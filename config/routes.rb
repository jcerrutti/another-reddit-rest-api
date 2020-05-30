Rails.application.routes.draw do
  get 'posts', to: 'post#get_posts'
end
