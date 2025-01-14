Rails.application.routes.draw do
  #root "movies#index" #even shorter short hand syntax
  
  root "directors#index"
  # Routes for the Movie resource:
  resources :movies

  #Shortcut to make routes for Director resource
  resources :directors
  
  # # CREATE

  # post "/movies" => "movies#create", as: :movies #movies_url and movies_path
  
  # get "/movies/new" => "movies#new", as: :new_movie #new_movie_url and new_movie_path

  # # READ
  # get "/movies" => "movies#index" #already defined above
  
  # get "/movies/:id" => "movies#show", as: :movie #movie_path(arg)
  
  # # UPDATE
  
  # patch "/movies/:id" => "movies#update" #already defined above
 
  # get "/movies/:id/edit" => "movies#edit", as: :edit_movie #edit_movie_path(arg)
  
  # # DELETE

  # delete "/movies/:id" => "movies#destroy" #already defined above

  #------------------------------
end