Rails.application.routes.draw do
  devise_for :users
    devise_scope :user do
      get "/users/sign_out" => "devise/sessions#destroy"
    end
    
  resources :articles do
    resources :comments
  end

  root "articles#index"
end
