Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'articles#index'
  # get 'articles' => 'articles#index'
  resources :admin_articles, except: :show, controller: 'admin_articles'
  resources :articles, controller: 'articles'
end
