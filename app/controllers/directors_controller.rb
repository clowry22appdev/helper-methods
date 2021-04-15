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
      director_attributes = params.require(:director).permit(:name, :dob, :bio)
      @director = Director.new(director_attributes)
    

      if @director.valid?
        @director.save
        redirect_to directors_url,  notice: "Director created successfully." 
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