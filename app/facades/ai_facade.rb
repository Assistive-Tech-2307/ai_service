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

  def tech_details(tech)
    message = tech_details_message(tech)
    result = @service.chat_to_ai(message)
    tech = JSON.parse(result[:choices].first[:message][:content], symbolize_names: true)
    DetailedTech.new(tech)
  end

  private

  def create_message(params)
    categories = params.keys
    tech_needs = params[categories.first][:tech_needs].join(", ")
    disability_description = params[categories.first][:disability_description].first
    "Finish your thought, but please provide a cross-platform list of #{tech_needs} for people who #{disability_description}. Please provide a definition of each tool and a website for further exploration. Format your whole response as a valid JSON object, with each tech and it's information being a separate nested object in the technologies array like so {'technologies'=>[{'name'=>'tool_name', 'definition'=>'tool_definition', 'website'=>'tool_website'}]}"
  end

  def tech_details_message(tech)
    "Provide a detailed description of #{tech}. Include the key features: compatibility, versatility, and any professional features. Additionally, include the key user experiences: reliability, performance, and community engagement. Ensure the response is informative and covers various aspects of #{tech}. Formated as a JSON like so {key_features => {compatability => String, versatility => String, professional_features => String}, user_experiences => {reliability => String, performance => String, community_engagement => String}, detailed_description => String} keys should be all lowercase"
  end

end