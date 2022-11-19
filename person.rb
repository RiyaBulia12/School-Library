require './nameable'

class Person < Nameable
  # Getters
  attr_reader :id

  # Getters and Setters combined
  attr_accessor :name, :age, :rentals

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # Private method
  def of_age?
    @age >= 18
  end

  # Public method
  def can_use_services?
    return unless of_age? || @parent_permission

    true
  end

  def self.list_people(people)
    return print puts "--------------------------------------------------------\n No records Found \n--------------------------------------------------------" if people.length.zero?
    puts "---------------------------- \n List of all people \n----------------------------"
    people.each do |person|
      puts "Id: #{person.id}  Name: #{person.name}  Age: #{person.age}"
    end
    puts '--------------------------------------------------------'
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals << rental
  end

  private :of_age?
end
