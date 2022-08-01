class Serializer
  def self.attribute(text)
  end

  def initialize(object)
    @obj = object
  end

  def serialize
    obj = @obj.to_h
    obj.keys.each do |key|
      if obj[key].nil?
        obj = obj.except(key)
      end
      if obj[key].class == Date
        obj[key] = Date.parse(obj[key].to_s).strftime("%d-%m-%Y")
      end
    end
    return obj
  end

  def obj
    @obj
  end
end