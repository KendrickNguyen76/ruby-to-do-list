# This file contains the ProgramUI class, which is responsible
# for displaying the to-do app in the terminal.

# Constants
PROGRAM_LOGIC_PATH = "./v2/program_logic.rb"

# Requirements
require PROGRAM_LOGIC_PATH

class ProgramUI
    def initialize
        # When intialized, will ask the user for a file path and also inputs
        # the starting directions.
        get_list_path()
        start_up_page()
    end

    def get_list_path
        # Prompts the user to enter a path to a file, then creates a class variable
        # called program_logic that utilizes it for initialization. Then puts an empty
        # line to continue the program.

        print "\nPlease enter a path to a file: "
        list_path = gets.chomp()
        @@program_logic = ProgramLogic.new(list_path)
        puts "\n"
    end

    def start_up_page
        # Prints out start up page to begin the program
        puts "Welcome to your to-do list (now new and improved!)"
        puts "Please input HELP for access to basic commands"
        print_divider()
    end

    def print_divider
        # Prints a long line of "=" which acts as a divider
        100.times {print "="}
        puts
    end
end