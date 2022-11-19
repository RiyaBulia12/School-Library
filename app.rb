require './book'
require './rental'
require './student'
require './teacher'
require './person'

def list_rental
  puts "---------------------------- \n List of all rentals of a person\n----------------------------"
  if @rentals.length.zero?
    puts " Person did not rent any book  \n--------------------------------------------------------"
  end
  puts ' Enter Id of a person'
  person_id = gets.chomp.to_i

  @rentals.each do |rental|
    if rental.person.id == person_id
      puts "On #{rental.date}, #{rental.book.title} book is rented by #{rental.person.name}"
      puts '--------------------------------------------------------'
    end
  end
end

def create_rental
  list_books
  print 'Book Id: '
  book_id = gets.chomp.to_i

  list_people
  print 'Person Id: '
  person_id = gets.chomp.to_i

  print 'Date: '
  date = gets.chomp

  @b = Object.new
  @books.each do |book|
    @b = book if book.id == book_id
  end

  @p = Object.new
  @people.each do |person|
    @p = person if person.id == person_id
  end

  rental = Rental.new(date, @b, @p)
  @rentals << rental

  puts "Rental created successfully\n-------------------------------------"
end

class App

  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def create_person
    puts "---------------------------- \n Do you want to create a \n1. Student or \n2. Teacher"
    option = gets.chomp.to_i

    case option
    when 1
      Student.create_student(@people)
    when 2
      Teacher.create_teacher(@people)
    else
      puts 'Invalid choice'
    end
  end

  def user_choice
    puts 'Enter your choice: '
    choice = gets.chomp.to_i

    case choice
    when 1
      Book.list_books(@books)
    when 2
      Person.list_people(@people)
    when 3
      create_person
    when 4
      Book.create_book(@books)
    when 5
      create_rental
    when 6
      list_rental
    when 7
      exit
    else
      puts 'Invalid choice'
    end
  end
end
