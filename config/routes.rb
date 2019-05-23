Rails.application.routes.draw do
  resources :charges do
     collection do
        get :details
      end
  end
  resources :agents
  resources :properties do
      collection do
        get :approval_new
        get :approval_type
        get :back
        get :get_status
      end
  end
  resources :orders
  get '/dashboard',to: "user_panel#index", as: :user_panel
  get 'admin_panel',to: 'admin_panel#index',as: :admin_panel
  get 'admin_panel/transaction',to: 'admin_panel#transaction',as: :admin_trans
  get 'user_invoice',to: 'admin_panel#invoice',as: :invioce_user
  get 'admin_panel/users',as: :admin_users

  devise_for :users,:controllers => { sessions: 'users/sessions',registrations: 'users/registrations',passwords: 'users/passwords' }
  root 'home#home'
  get 'admin', to: 'home#admin', as: :admin
  resources :users


end
