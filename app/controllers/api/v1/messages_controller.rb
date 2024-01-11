class Api::V1::MessagesController < ApplicationController
  def create
    message_body_info = ai_facade.tech_details(params[:title])

    message_body = "Community Engagement: #{message_body_info.community_engagement}\n Compatibility: #{message_body_info.compatibility}\n Detailed Description: #{message_body_info.detailed_description}\n Performance: #{message_body_info.performance}\n Professional Features: #{message_body_info.professional_features}\n Reliability: #{message_body_info.reliability}\n Versatility: #{message_body_info.versatility}"
    
    twilio_facade.send_text(params[:user_phone_number], message_body.first(1500))

    render json: { "message": "Message successfully sent!" }
  end

  private

    def ai_facade
      AiFacade.new
    end

    def twilio_facade
      TwilioFacade.new
    end
end