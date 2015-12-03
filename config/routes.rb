
Rails.application.routes.draw do
  devise_for :users

  root :to => 'visitors#index'

  resources :students

  resources :teachers

  controller :reports do
    get 'reports/subjects' => :subjects
  end

  resource :student_subjects

  resource :teacher_subjects

end
