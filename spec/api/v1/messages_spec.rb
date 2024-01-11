require "rails_helper"

RSpec.describe "Message endpoint" do
  it "returns successfully sent message when text has been sent without issue", :vcr do
    data = {
      "user_phone_number": "+18777804236",
      "title": "NVDA (NonVisual Desktop Access)"
    }

    post "/api/v1/messages", params: data, as: :json

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to have_key(:message)
    expect(result[:message]).to eq("Message successfully sent!")
  end
end