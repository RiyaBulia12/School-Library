require './person'

# extends person class
class Student < Person
  attr_accessor :classroom

  # extends parent's constructor by adding @classroom and a parameter for it
  def initialize(age, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = nil
  end

  def self.create_student(people)
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    parent_permission.upcase!

    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    else
      print 'Enter either Y or N only'
    end

    people << new(age, name:, parent_permission:)
    puts "Student created successfully\n-------------------------------------"
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
