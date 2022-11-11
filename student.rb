require './person'

# extends person class
class Student < Person
  attr_accessor :classroom

  # extends parent's constructor by adding @classroom and a parameter for it
  def initialize(age, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = nil
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
