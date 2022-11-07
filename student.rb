require './person'

# extends person class
class Student < Person
  # extends parent's constructor by adding @classroom and a parameter for it
  def initialize(classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
