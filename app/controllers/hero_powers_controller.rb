class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    protect_from_forgery with: :null_session
  
    def create
      hero_power = HeroPower.create!(hero_power_params)
      render json: hero_power.hero, status: :created, serializer: HeroPowerSerializer
    end
  
    private
  
    def hero_power_params
      params.permit(:strength, :power_id, :hero_id)
    end
  
    def render_unprocessable_entity(invalid)
      render json: {
               errors: invalid.record.errors.full_messages,
             },
             status: :unprocessable_entity
    end
  end