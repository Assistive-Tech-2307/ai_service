class TechSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :website
end
