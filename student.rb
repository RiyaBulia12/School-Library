require './person'

# extends person class
class Student < Person
  attr_accessor :classroom

  # extends parent's constructor by adding @classroom and a parameter for it
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
