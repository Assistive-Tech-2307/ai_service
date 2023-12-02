class AiFacade
  
  def initialize()
    @service = AiService.new
  end

  def ai_chat(params)
    message = create_message(params)
    result = @service.chat_to_ai(message)
  end

  private

  def create_message(params)
    categories = params.keys
    tech_needs = params[categories.first][:tech_needs].join(", ")
    disability_description = params[categories.first][:disability_description].first
    "Please provide a cross-platform list of #{tech_needs} for people who #{disability_description}. Please provide a definition of each tool and a website for further exploration. Format your response as a JSON object, with each tech and it's information being a separate nested object"
  end

end