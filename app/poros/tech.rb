class Tech
  attr_reader :title, :description, :website, :id

  def initialize(data)
    @id = nil
    @title = data[:name]
    @description = data[:description]
    @website = data[:website]
  end
end