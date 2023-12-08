class DetailedTech
  attr_reader :compatibility, :versatility, :professional_features, :id,
              :reliability, :performance, :community_engagement, :detailed_description

  def initialize(data)
    @id = nil
    @compatibility = data[:key_features][:compatibility] 
    @versatility = data[:key_features][:versatility] 
    @professional_features = data[:key_features][:professional_features] 
    @reliability = data[:user_experiences][:reliability]
    @performance= data[:user_experiences][:performance]
    @community_engagement = data[:user_experiences][:community_engagement]
    @detailed_description = data[:detailed_description] 
  end
end