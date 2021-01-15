Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :surgeries, only: [:index, :show] do
    resources :doctors, only: [:create], controller: :surgery_doctors
  end
end
