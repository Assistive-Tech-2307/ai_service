class Tech
  attr_reader :title, :description, :website, :id, :category

  def initialize(data, category)
    @id = nil
    @category = category
    @title = data[:name] || data[:title]
    @description = data[:definition] || data[:description]
    @website = data[:website]
  end
end