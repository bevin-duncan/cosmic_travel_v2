class ScientistsController < ApplicationController

before_action :find_scientist, except: :index

    def index
        render json: Scientist.all
    end 

    def show 
        render json: @scientist, serializer: ScientistWithPlanetSerializer
    end

    def create
        newScientist = Scientist.create!(scientist_params)
        render json: newScientist, status: :created
    end

    def update
        @scientist.update!(scientist_params)
        render json: @scientist, status: :accepted
    end

    def destroy 
        @scientist.destroy 
        head :no_content
    end


    private 

    def find_scientist
        @scientist = Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end 
end
