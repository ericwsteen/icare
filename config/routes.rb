Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions'
                                  }

  resources :agencies, only: :index
  resources :profiles do
    resources :agencies, except: :index
    resources :homes
    resources :parents
    resources :children
  end
  resources :preferences do
    resources :risks
    resources :physicals
    resources :emotions
    resources :developments
    resources :learnings
    resources :behaviors
  end
  namespace :ujs do
    resources :trainings, :courses, :preferences,
              only: [:edit, :update, :destroy]
  end
  root to: 'welcome#index'
end
