class Book
  attr_accessor :title, :author, :rentals
  attr_reader :id

  def initialize(title, author)
    @id = rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def self.list_books(books)
    return print "-------------------------------------------------------- \n No books added  \n--------------------------------------------------------" if books.empty?
    puts "---------------------------- \n List of all books \n----------------------------"

    books.each do |book|
      puts "Id: #{book.id}  Title: #{book.title}  Author: #{book.author}"
    end
    puts '--------------------------------------------------------'
  end

  def self.create_book(books)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    new(title, author)
    books << book
    puts "Book created successfully\n-------------------------------------"
  end

  def add_rental(rental)
    @rentals << rental
  end
end
