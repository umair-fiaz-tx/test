Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/show'
  get 'comments/new'
  get 'comments/edit'
  # root to: 'pages#home'

  root :to => redirect("/users/sign_in")


  devise_for :users

  get 'welcome/index'

  resources :articles do
   resource :comments

  end
end

