
Rails.application.routes.draw do
  devise_for :users

  root :to => 'visitors#index'

  resources :students do
    member do
      get 'subjects'
    end
  end

  resources :teachers do
    member do
      get 'subjects'
    end
  end

  controller :reports do
    get 'reports/subjects' => :subjects
  end


end
