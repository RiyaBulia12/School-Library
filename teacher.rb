require './person'

# extends person class
class Teacher < Person
  # extends person constructor and @specialization
  def initialize(specialization, age, name: 'Unknown', parent_permission: true)
    super(age, name:, parent_permission:)
    @specialization = specialization
  end

  def self.create_teacher(people)
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name:)
    people << teacher
    puts "Teacher created successfully\n-------------------------------------"
  end

  # overrides can_use_services? = always true
  def can_use_services?
    true
  end
end
