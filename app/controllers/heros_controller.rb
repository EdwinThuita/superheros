class HerosController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
    def index
      heroes = Hero.all
      render json: heroes, status: :ok
    end
  
    def show
      hero = Hero.find(params[:id])
      render json: hero, status: :ok, serializer: HeroPowerSerializer
    end
  
    private
  
    def not_found_response
      render json: { error: 'Hero not found' }, status: :unprocessable_entity
    end
  end