Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do 
    resources :blogs, only: :index
  end
  resources :blogs, only: [:create, :show, :update, :destroy]
  # get '/blogs/random', to: 'blogs#random_blog'
  get '/blogs', to: 'blogs#find_all_blogs'
end
