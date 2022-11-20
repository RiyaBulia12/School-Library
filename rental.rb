require './book'
require './person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    person.rentals << self
  end

  def self.create_rental(books, people)
    if books != [] || people != []
      Book.list_books(books)
      print 'Book Index: '
      book_id = gets.to_i

      Person.list_people(people)
      print 'Person Index: '
      person_id = gets.to_i

      print 'Date: '
      date = gets.chomp

      Rental.new(date, books[book_id], people[person_id]) if books[book_id] != nil|| people[person_id] != nil
      puts "Rental created successfully\n-------------------------------------"
    else
      puts "No rental created\n-------------------------------------"
    end

  end

end
