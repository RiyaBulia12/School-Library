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
      puts 'Invalid choice'
    end
  end

  def list_rental_book_person
    puts "---------------------------- \n Do you want to list rental details by a \n1. Person Id or \n2. Book Id"
    option = gets.chomp.to_i

    case option
    when 1
      Person.list_rental_by_person_id(@people, @rentals)
    when 2
      Book.list_rental_by_book_id(@book, @rentals)
    else
      puts 'Invalid choice'
    end
  end

  def add_rental
    rental =  Rental.create_rental(@books, @people)
    @rentals << rental
    puts "Rental created successfully\n-------------------------------------"
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
      add_rental
    when 6
      list_rental_book_person
    when 7
      exit
    else
      puts 'Invalid choice'
    end
  end
end
