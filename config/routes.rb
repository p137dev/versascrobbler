Rails.application.routes.draw do
  
  root 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'scrobble' => 'scrobbler#scrobble'
  resources :logfile_contents, only: [:create]
  
end
