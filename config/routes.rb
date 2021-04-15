Rails.application.routes.draw do
  #get "/",  controller: "movies", action: "index" 
  #get "/" => "movies#index" #short hand syntax
  root "movies#index" #even shorter short hand syntax

  # Routes for the Movie resource:

  # CREATE
  #post("/movies", { :controller => "movies", :action => "create" })
  post "/movies" => "movies#create"
  # get("/movies/new", { :controller => "movies", :action => "new" })
  get "/movies/new" => "movies#new"

  # READ
  # get("/movies", { :controller => "movies", :action => "index" })
  get "/movies" => "movies#index"
  # get("/movies/:id", { :controller => "movies", :action => "show" })
  get "/movies/:id" => "movies#show"
  
  # UPDATE
  # patch("/movies/:id", { :controller => "movies", :action => "update" })
  patch "/movies/:id" => "movies#update"
  # get("/movies/:id/edit", { :controller => "movies", :action => "edit" })
  get "/movies/:id/edit" => "movies#edit"
  
  # DELETE
  # delete("/movies/:id", { :controller => "movies", :action => "destroy" })
  get "/movies/:id" => "movies#destroy"

  #------------------------------
end