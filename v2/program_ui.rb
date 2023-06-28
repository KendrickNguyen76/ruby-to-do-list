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
        @program_logic = ProgramLogic.new(list_path)
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

    def is_running?
        # Method returns true if the program should still be running,
        # else it returns false to indicate that it should be over
        return @program_logic.running
    end

    def print_array(arr, start = "")
        # Needs to be given an array. Will print out all the stuff in that array.
        # Start is a default argument that you can change if necessary to make
        # your final printing result a bit different each time.
        arr.each { |item| puts start + item }
    end

    def ask_for_input
        # Asks the user for a command. Returns it as a string.
        print "Please enter a command: "
        command = gets.chomp
        puts

        return command
    end

    def handle_input(user_command)
        # Needs to be given a string that represents a user's command
        # Checks that it is valid and does different actions depending
        # on what it is.
        user_command.upcase!

        case user_command
            when "EXIT"
                carry_out_exit()
            when "CFILE"
                carry_out_cfile()
            when "LOAD"
                carry_out_load()
            when "HELP"
                carry_out_help()
            else
                puts "Command Invalid. Try again."
        end
        
        print_divider()
    end

    def carry_out_exit
        # Processes the "exit" command
        @program_logic.end_program()
        puts "Program ended, thank you!"
    end

    def carry_out_cfile
        # Processes the "cfile" command
        puts "Current file being used: #{@program_logic.list_path}"
    end

    def carry_out_load
        # Processes the "load" command
        print "Enter a new file path: "
        new_path = gets.chomp
        @program_logic.set_new_file_path(new_path)
        puts "\nNew file path set."
    end

    def carry_out_help
        # Processes the "help" command
        help_text = @program_logic.read_from_file(@program_logic.help_txt_path)
        print_array(help_text)
    end
end