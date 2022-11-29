class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_params
    # POST /signups
    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    end

    private
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def invalid_params
        render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end
end
