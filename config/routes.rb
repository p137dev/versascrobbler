Rails.application.routes.draw do
  
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'
  root 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'scrobble' => 'scrobbler#scrobble'
  resources :logfile_contents, only: [:create]
  
end
