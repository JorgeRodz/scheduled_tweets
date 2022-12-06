Rails.application.routes.draw do
  # ----- Deferent ways fo defining root path -----
  # get '/', to: 'main#index'
  # root 'main#index'
  root to: 'main#index'

  # ----- Deferent ways fo defining root path -----
  # get '/about', to: 'about#index'
  # 👇 text url on browser, controller, path/prefix name
  get '/about-us', to: 'about#index', as: :about
end
