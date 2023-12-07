class Api::V1::AiRequestsController < ApplicationController

  def create
    result = AiFacade.new.ai_chat(params[:needs])
    render json: TechSerializer.new(result)
  end

  def index
    result = AiFacade.new.tech_details(params[:tech])
    render json: DetailedTechSerializer.new(result)
  end
end