Rails.application.routes.draw do
  root 'home#index'
  resources :courses, only: %i[show new create], param: :code
  resources :enrollments, only: %i[index]
end
