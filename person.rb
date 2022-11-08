require './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # Getters for @id
  attr_reader :id

  # Getter and Setter for @name and @age
  attr_accessor :name, :age

  # Private method
  def of_age?
    @age >= 18
  end

  # Public method
  def can_use_services?
    return unless of_age? || @parent_permission

    true
  end

  def correct_name
    @name
  end

  private :of_age?
end
