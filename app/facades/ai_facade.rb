class AiFacade
  
  def initialize()
    @service = AiService.new
  end

  def ai_chat(params)
    message = create_message(params)
    result = @service.chat_to_ai(message)
    tech_hash = JSON.parse(result[:choices].first[:message][:content], symbolize_names: true)
    techs = tech_hash[tech_hash.keys.first]
    techs.map do |tech|
      Tech.new(tech, params.keys.first)
    end
  end

  private

  def create_message(params)
    categories = params.keys
    tech_needs = params[categories.first][:tech_needs].join(", ")
    disability_description = params[categories.first][:disability_description].first
    "Finish your though, but please provide a cross-platform list of #{tech_needs} for people who #{disability_description}. Please provide a definition of each tool and a website for further exploration. Format your response as a valid JSON object, with each tech and it's information being a separate nested object in the technologies array like so {'technologies'=>[{'name'=>'tool_name', 'definition'=>'tool_definition', 'website'=>'tool_website'}]}"
  end

end