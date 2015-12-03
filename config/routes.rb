
Rails.application.routes.draw do
  devise_for :users

  root :to => 'visitors#index'

  resources :students

  resources :teachers

  resource :report_subjects

end
