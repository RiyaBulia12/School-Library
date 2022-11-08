class Classroom
  attr_accessor :label
  attr_reader :students

  def initalize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
  end

end
