class Tech
  attr_reader :title, :description, :website, :id, :category

  def initialize(data, category)
    @id = nil
    @category = category
    @title = data[:name]
    @description = data[:definition]
    @website = data[:website]
  end
end