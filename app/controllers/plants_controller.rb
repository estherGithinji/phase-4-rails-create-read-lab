class PlantsController < ApplicationController
    wrap_parameters format: []


    def index
        plants = Plant.all 
        render json: plants
    end

    def show 
        plant = Plant.find_by(id: params[:id])
        if plant 
            render json: plant
        else
            render json: { error: "Plant not found" }, status: 404
        end
    end

    def create 
        plant = Plant.create(plants_params)
        render json: plant, status: 201
    end

    private

    def plants_params
        params.permit(:name, :image, :price)
    end
end
