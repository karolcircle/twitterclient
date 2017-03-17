Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'twitters/twitter_search'

  resources :twitter_accounts

  get 'dashboard/show'

  get 'twitter_accounts/refresh_button/:id' => 'twitter_accounts#refresh_button'

end
