Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Redirect the landing page to the index method in posts_controller
  root 'posts#index', as: 'home'

  # Get request for /about, redirect to about method in pages_controller
  get 'about' => 'pages#about', as: 'about'

  # This sets up all the CRUD operations for posts
  resources :posts do
    # This is to nest comments in posts
    # e.g. posts/2/comments
    resources :comments
  end
end
