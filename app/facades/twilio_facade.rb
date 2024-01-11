class TwilioFacade

  def initialize()
    @service = TwilioService.new
  end
  
  def send_text(user_phone_number, body)
    client = @service.client

    client.messages.create(
      from: Rails.application.credentials.twilio[:phone_number],
      to: user_phone_number,
      body: body
    )
  end
end