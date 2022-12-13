Rails.application.routes.draw do
  # ----- Deferent ways fo defining root path -----
  # get '/', to: 'main#index'
  # root 'main#index'
  root to: 'main#index'

  # ----------------------------- Routes -----------------------------
  # ----- Customize url and path/prefix name -----
  # get '/about', to: 'about#index'
  # 👇 text url on browser, controller, path/prefix name
  get 'about-us', to: 'about#index', as: :about

  get 'sign-up', to: 'registrations#new' # display the 'new' view in which we contain the form
  post 'sign-up', to: 'registrations#create' # triggers when the form is submitted
end
