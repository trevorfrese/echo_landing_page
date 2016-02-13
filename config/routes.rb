Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root            'home_page#interested_users_home'

  get  '/' => 'home_page#interested_users_home'
  get 'home_page/interested_users_home' => 'home_page#interested_users_home'
  post 'home_page/interested_users_home' =>      'interested_users#sign_up'
  get 'home_page/home' => 'home_page#home'
  get 'posts' => 'posts#show'
  get 'map' => 'map#show'
  get 'map/:id' => 'map#upvote'

  resources :posts,          only: [:create, :destroy]

end
