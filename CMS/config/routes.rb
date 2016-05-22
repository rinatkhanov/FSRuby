Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"
  resources :pages, :users
  mount Ckeditor::Engine => '/ckeditor'
  get '/blog', to: 'pages#blog'
  get '/users/:id/upgrade', to: 'users#upgrade', as: :upgrade
  get '/users/:id/downrade', to: 'users#downgrade', as: :downgrade
end
