# This file contains all of the code for running the UI bits of the to do app
# in the terminal.

# CONSTANTS
LOGIC_PATH = "./to_do_logic.rb"

# Requirements
require LOGIC_PATH

def start_page
    # This method welcomes the user to the program and prompts them to
    # input HELP into the terminal if they require assistance.
    puts "Welcome to your to-do list!"
    puts "Please input HELP (in all caps) if you would like a list of basic commands"
    print_divider()
end

def print_divider
    # This method prints a long line of "=", which serves as a divider.
    # Doesn't really do anything significant, just helps to make things
    # look better.
    for i in 0...100
        print "="
    end

    puts
end

def print_array(arr, start = "")
    # Needs to be given an array. Will print out all the stuff in that array.
    # Start is a default argument that you can change if necessary to make
    # your final result a bit different each time.
    arr.each do |item|
        puts start + item
    end
end

def ask_for_command
    # This method asks the user for a command. Once the user inputs something,
    # it will return that.
    print "Please enter a command: "
    command = gets.chomp
    puts

    return command
end

def get_command_processed(command)
    # This method takes one argument, which is a string. It processes this
    # string to see if it is a valid command using is_valid_command. If it isn't
    # a valid command, an error message is printed out to let the user know. If it
    # is, carry that command out.
    if is_valid_command(command)
        command.upcase!
        if command == "EXIT"
            # Don't do anything, the program will end
            puts process_exit()
        elsif command == "HELP"
            # Print out helpful info the user might need
            help_text = process_help()
            print_array(help_text)
        elsif command == "LIST"
            # Print out the contents of the user's list
            list_text = process_list()
            puts "Your To-Do List: "
            print_array(list_text, "- ")
        end
        print_divider()
    else
        puts "This is an invalid command, try again."
        print_divider()
    end
end
