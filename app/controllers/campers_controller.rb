class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_params
    # GET /campers
    def index
        render json: Camper.all, status: :ok
    end

    # GET /campers/:id
    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitySerializer
    end

    # POST /campers
    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private
    def camper_params
        params.permit(:name, :age)
    end

    def render_not_found
        render json: {error: "Camper not found"}
    end

    def invalid_params
        render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end



end
