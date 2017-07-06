Rails.application.routes.draw do
  root to: "images#index"
  devise_for :users

  resources :user do
    resources :images
  end

  resources :images do
    resources :comments
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
