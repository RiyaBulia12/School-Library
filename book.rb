class Book
  attr_accessor :id, :title, :author, :rentals

  def initialize(title, author)
    @id = rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def self.list_rental_by_book_id(books, rentals)
    if rentals.length.zero?
      return puts "---------------------------- \n  No rentals record \n----------------------------"
    end

    list_books(books)
    print 'Enter Id of a book: '
    book_id = gets.chomp.to_i

    puts "---------------------------- \n List of all rentals \n----------------------------"
    rentals.map do |rental|
      if rental.book.id == book_id
        puts "On #{rental.date}, #{rental.book.title} book is rented by #{rental.person.name}"
        puts '--------------------------------------------------------'
      end
    end
  end

  def self.list_books(books)
    if books.length.zero?
      return print "---------------------------- \n No books added  \n----------------------------"
    end

    puts "---------------------------- \n List of all books \n----------------------------"

    books.each do |book|
      puts "Index: #{books.find_index(book)}  Id: #{book.id} Title: #{book.title}  Author: #{book.author}"
    end
    puts '--------------------------------------------------------'
  end

  def self.create_book(books)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    books << new(title, author)
    puts "Book created successfully\n-------------------------------------"
  end

  def add_rental(rental)
    @rentals << rental
  end
end
