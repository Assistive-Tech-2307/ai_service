class AiService

  def conn
    Faraday.new(url: "https://api.openai.com/v1/completions",
      headers: {
        'Authorization' => "Bearer #{Rails.application.credentials.open_ai[:key]}",
        'Content-Type' => 'application/json'
      }
    )
  end
end