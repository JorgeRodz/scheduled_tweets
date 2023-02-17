Rails.application.routes.draw do
  # ----- Deferent ways fo defining root path -----
  # get '/', to: 'main#index'
  # root 'main#index'
  root to: 'main#index'

  # /----------------------------- Routes -----------------------------
  # *----- Customize url and path/prefix name -----
  # get '/about', to: 'about#index'
  # 👇 text url on browser, controller, path/prefix name
  get 'about-us', to: 'about#index', as: :about

  # *----- user registration(sign up) -----
  # display the 'new' view in which we contain the form
  get 'sign-up', to: 'registrations#new'

  # triggers when the form is submitted - create the user and log them in
  post 'sign-up', to: 'registrations#create'
  # *----- user registration -----

  # *----- user session(sign in, sing out) -----
  # display the 'new' view in which we contain the form for sign in
  get 'sign-in', to: 'sessions#new'

  # triggers when the form is submitted - sign in the user
  post 'sign-in', to: 'sessions#create'

  # triggers when the form is submitted - log out
  delete 'logout', to: 'sessions#destroy' # triggers when we click the logout button
  # *----- user session -----

  # *----- Change password -----
  get 'password', to: 'passwords#edit', as: :edit_password
  patch 'password', to: 'passwords#update'
  # *----- Change password -----

  # *----- Reset password -----
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'

  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
  # *----- Reset password -----

  # *----- twitter omniauth authentications-----
  get 'auth/twitter/callback', to: 'omniauth_callbacks#twitter'
  # *----- twitter omniauth authentications-----
end
