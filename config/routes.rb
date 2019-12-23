# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :articles, only: %i[index show]
    end
  end

  root to: 'top_pages#show'
  resources :public_images, param: :uuid, only: %i[show]
  resource :about, controller: 'abouts', only: %i[show]
end
