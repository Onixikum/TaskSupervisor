Rails.application.routes.draw do
  root 'static_pages#welcome'
  get 'users/show',    as: 'user_root'

  devise_for :users

  resources :users do
    resources :projects
  end

end
