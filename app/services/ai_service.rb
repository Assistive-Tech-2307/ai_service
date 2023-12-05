class AiService

  def conn
    Faraday.new(url: "https://api.openai.com/",
      headers: {
        'Authorization' => "Bearer #{Rails.application.credentials.open_ai[:key]}",
        'Content-Type' => 'application/json'
      }
    )
  end

  def post_chat(url, payload = nil)
    response = conn.post(url, payload)
    JSON.parse(response.body, symbolize_names: true)
  end

  def chat_to_ai(message)
    payload = {
      model: "gpt-3.5-turbo-1106",
      response_format: { "type": "json_object" },
      max_tokens: 700,
      messages: [
        {
          role: "system",
          content: "You are a helpful assistant."
        },
        {
          role: "user",
          content: message
        }
      ]
    }.to_json

    post_chat("v1/chat/completions", payload)
  end
end