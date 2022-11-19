# require './book'
# require './person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def self.create_rental(books, people)
    # Book.list_books(books)
    print 'Book Id: '
    book_id = gets.to_i

    # Person.list_people(people)
    print 'Person Id: '
    person_id = gets.to_i

    print 'Date: '
    date = gets.chomp

    p books[book_id]
    p people[person_id]
    Rental.new(date, books[book_id], people[person_id])
  end

end
