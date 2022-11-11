require './book'
require './rental'
require './student'
require './teacher'
require './person'

def list_books
  puts "---------------------------- \n List of all books \n----------------------------"
  puts " No books added  \n--------------------------------------------------------" if @books.length.zero?
  @books.each do |book|
    puts "Id: #{book.id}  Title: #{book.title}  Author: #{book.author}"
  end
  puts '--------------------------------------------------------'
end

def list_people
  puts "---------------------------- \n List of all people \n----------------------------"
  puts " Data is empty \n--------------------------------------------------------" if @people.length.zero?
  @people.each do |person|
    puts "Id: #{person.id}  Name: #{person.name}  Age: #{person.age}"
  end
  puts '--------------------------------------------------------'
end

def list_rental
  puts "---------------------------- \n List of all rentals of a person\n----------------------------"
  if @rentals.length.zero?
    puts " Person did not rent any book  \n--------------------------------------------------------"
  end
  puts ' Enter Id of a person'
  person_id = gets.chomp.to_i

  @rentals.each do |rental|
    if rental.person.id == person_id
      puts "Date: #{rental.date} \nBook: #{rental.book.title} \nAuthor: #{rental.book.author}"
      puts "--------------------------------------------------------"
    end
  end
end

def create_person
  puts "---------------------------- \n Do you want to create a \n1. Student or \n2. Teacher"
  option = gets.chomp.to_i

  case option
  when 1
    create_student
  when 2
    create_teacher
  else
    puts 'Invalid choice'
  end
end

def create_student
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Has parent permission? [Y/N]: '
  parent_permission = gets.chomp
  parent_permission.upcase!

  case parent_permission
  when 'Y'
    parent_permission = true
  when 'N'
    parent_permission = false
  else
    print 'Enter either Y or N only'
  end

  student = Student.new(age, name: name, parent_permission: parent_permission)
  @people << student
  puts "Student created successfully\n-------------------------------------"
end

def create_teacher
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Specialization: '
  specialization = gets.chomp

  teacher = Teacher.new(specialization, age, name: name)
  @people << teacher
  puts "Teacher created successfully\n-------------------------------------"
end

def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp

  book = Book.new(title, author)
  @books << book
  puts "Book created successfully\n-------------------------------------"
end

def create_rental
  puts 'Select a book from the following list by number'
  list_books
  print 'Book Id: '
  book_id = gets.chomp.to_i

  puts 'Select a person from the following list by number (Not ID): '
  list_people
  print 'Person Id: '
  person_id = gets.chomp.to_i

  print 'Date: '
  date = gets.chomp

  rental = Rental.new(date, @books[book_id], @people[person_id])
  @rentals << rental
  p @rentals
  puts "Rental created successfully\n-------------------------------------"
end

class App
  @books = []
  @people = []
  @rentals = []

  puts "Welcome to OOP School Library App!\n"
  loop do
    puts 'Please choose an option by entering a number:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Exit'

    puts 'Enter your choice: '
    choice = gets.chomp.to_i

    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
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
