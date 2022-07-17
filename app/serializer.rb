class Serializer
  def self.attribute(text)
  end

  def initialize(object)
    @obj = object
  end

  def serialize
    if obj.class.name == "Comment"
      return obj.to_h.except(:title)
    elsif obj.class.name == "Post"
      title = obj.to_h[:title]
      id = obj.to_h[:id]
      date = obj.to_h[:date]
      obj = obj.to_h
      obj[:title] = title
      obj[:id] = id
      obj[:date] = Date.parse(date.to_s).strftime("%d-%m-%Y")
      return obj
    end
  end

  def obj
    @obj
  end
end