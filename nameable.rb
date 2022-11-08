class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class Decorator < Nameable
  attr_accessor :name

  def initialize(name)
    super()
    @name = name
  end

  def correct_name
    @name.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @name.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    return unless @name.correct_name.length > 10

    @name.correct_name[0...10]
  end
end
