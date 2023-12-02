class Api::V1::AiRequestsController < ApplicationController

  def create
    result = AiFacade.new.ai_chat(params[:needs])
    require 'pry';binding.pry
    render json: result
  end
end