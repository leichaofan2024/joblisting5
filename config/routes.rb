Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :jobs
    resources :resumes
  end 

  root "jobs#index"
  resources :jobs do
    resources :resumes
  end
end
