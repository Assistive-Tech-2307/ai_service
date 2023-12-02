class Api::V1::AiRequestsController < ApplicationController

  def create
    result = AiFacade.new.ai_chat(params[:needs])
    render json: TechSerializer.new(result)
  end
end