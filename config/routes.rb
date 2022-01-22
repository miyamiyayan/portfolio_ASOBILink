Rails.application.routes.draw do

  root to: 'homes#top'

  resources :notifications, only: [:index]
  delete "/notifications/destroy_all" => 'notifications#destroy_all'
  resources :asobis do
    resources :post_comments, only: [:create, :destroy]
    resource :joins, only: [:create, :destroy]
  end

  get 'search' => 'asobis#search'
  get "/customers/" => 'customers#show'
  patch "/customers/" => 'customers#update'
  get "/customers/edit" => 'customers#edit'
  get "/customers/confirm" => 'customers#confirm'
  patch "/customers/withdraw" => 'customers#withdraw'

  devise_for :members, controllers: {
        sessions: 'members/sessions'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
