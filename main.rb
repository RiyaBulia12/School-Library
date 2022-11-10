# Present the user with a list of options to perform.
# Lets users choose an option.
# If needed, ask for parameters for the option.
# Have a way to quit the app.
require './app'

def main
  app = App.new
  loop { app }
end

main
