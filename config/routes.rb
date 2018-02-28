Rails.application.routes.draw do

  resources :listings

  root 'welcome#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
  resources :users, :only => [:show]
  resources :photos, :only => [:create, :destroy] do
  collection do
    get :list
  end
end

  get 'manage-listing/:id/basics',to: 'listings#basics', as: 'manage_listing_basics'
  get 'manage-listing/:id/description',to: 'listings#description', as: 'manage_listing_description'
  get 'manage-listing/:id/address',to: 'listings#address', as: 'manage_listing_address'
  get 'manage-listing/:id/price',to: 'listings#price', as: 'manage_listing_price'
  get 'manage-listing/:id/photos',to: 'listings#photos', as: 'manage_listing_photos'
  get 'manage-listing/:id/calendar',to: 'listings#calendar', as: 'manage_listing_calendar'
  get 'manage-listing/:id/bankaccount',to: 'listings#bankaccount', as: 'manage_listing_bankaccount'
  get 'manage-listing/:id/publish',to: 'listings#publish', as: 'manage_listing_publish'
#  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
