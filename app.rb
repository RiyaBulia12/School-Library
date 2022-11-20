require './book'
require './rental'
require './student'
require './teacher'
require './person'

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
      print 'Invalid choice'
    end
  end

  def list_rental_book_person
    puts "---------------------------- \n Do you want to list rental details by a \n1. Person Id or \n2. Book Id"
    option = gets.chomp.to_i

    case option
    when 1
      Person.list_rental_by_person_id(@people, @rentals)
    when 2
      Book.list_rental_by_book_id(@books, @rentals)
    else
      print 'Invalid choice'
    end
  end

  def user_choice(choice)
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
      @rentals << Rental.create_rental(@books, @people)
    when 6
      list_rental_book_person
    else
      puts 'Invalid choice'
    end
  end
end
