Rails.application.routes.draw do
  devise_for :users, :controllers =>{ :registrations =>"users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :welcome
  root 'welcome#index'
  namespace :admin do
     resources :jobs do
       member do
         post :publish
         post :hide
       end
       resources :resumes
     end
   end




  resources :jobs do
      collection do
          get :search
      end
   resources :resumes
  end

  resources :jobs do
    put :favorite, on: :member
  end

  resources :favorite


end
