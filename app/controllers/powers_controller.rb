class PowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_render
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_render
    protect_from_forgery with: :null_session
  
    def index
      powers = Power.all
      render json: powers, status: :ok
    end
  
    def show
      power = Power.find(params[:id])
      render json: power, status: :ok
    end
  
    def update
      power = Power.find(params[:id])
      power.update!(power_params)
  
      render json: power, status: :accepted
    end
  
    private
  
    def power_params
      params.permit(:name, :description)
    end
  
    def unprocessable_entity_render(entity)
      render json: { errors: entity.record.errors.full_messages }
    end
    def not_found_render
      render json: { error: 'Power not found' }, status: :unprocessable_entity
    end
  end