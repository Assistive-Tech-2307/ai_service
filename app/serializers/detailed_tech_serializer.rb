class DetailedTechSerializer
  include JSONAPI::Serializer
  attributes :compatibility, :versatility, :professional_features, :reliability, :performance, :community_engagement, :detailed_description
end
