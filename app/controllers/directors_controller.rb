class DirectorsController < ApplicationController
  def new
      @director = Director.new
    end

    def index
      @directors = Director.order( created_at:  :desc )

      respond_to do |format|
        format.json do
          render json: @directors
        end

        format.html 
      end
    end

    def show
      @director = Director.find(params.fetch(:id))
    end

    def create
      movie_attributes = params.require(:movie).permit(:title, :description)
      @movie = Movie.new(movie_attributes)
    

      if @movie.valid?
        @movie.save
        redirect_to movies_url,  notice: "Movie created successfully." 
      else
        render template: "new"
      end
    end

    def edit
      @movie = Movie.find(params.fetch(:id))

    end

    def update
      movie_attributes = params.fetch(:movie).permit( :title, :description)
      @movie = Movie.find(params.fetch(:id))
      @movie.update(movie_attributes)


      if @movie.valid?
        @movie.save
        redirect_to movie_url(@movie),  notice:  "Movie updated successfully." 
      else
        redirect_to movie_url(@movie),  alert:  "Movie failed to update successfully." 
      end
    end

    def destroy
      @movie = Movie.find(params.fetch(:id))

      @movie.destroy

      redirect_to movies_url,  notice:  "Movie deleted successfully."
    end
end