require './app'

def main
  app = App.new
  loop do
    menus
    print 'Enter your choice: '
    choice = gets.chomp.to_i
    return puts "----------------------\n Exiting Application\n----------------------\n" if choice == 7

    app.user_choice(choice)
  end
end

def menus
  puts "\nWelcome to OOP School Library App!\n"
  puts 'Please choose an option by entering a number:'
  menu_option = [
    '1. List all books',
    '2. List all people',
    '3. Create a person',
    '4. Create a book',
    '5. Create a rental',
    '6. List all rentals for a given person id',
    '7. Exit'
  ]
  puts menu_option
end

main
