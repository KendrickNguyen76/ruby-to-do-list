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
            when "LIST"
                carry_out_list()
            when "ADD"
                carry_out_add()
            when "CLEAR"
                carry_out_clear()
            else
                puts "Command Invalid. Try again."
        end
        
        print_divider()
    end

    def carry_out_exit
        # Processes the "exit" command. Ends the program.
        @program_logic.end_program()
        puts "Program ended, thank you!"
    end

    def carry_out_cfile
        # Processes the "cfile" command. Displays the current file path
        # being used to store the user's to-do list.
        puts "Current file being used: #{@program_logic.list_path}"
    end

    def carry_out_load
        # Processes the "load" command. ALlows the user to change
        # the path that points to the file that they want to store/get
        # their list from.
        print "Enter a new file path: "
        new_path = gets.chomp
        @program_logic.set_new_file_path(new_path)
        puts "\nNew file path set."
    end

    def carry_out_help
        # Processes the "help" command, which displays the help page.
        # The information for this page is stored in @program_logic's
        # help_txt_path instance variable.
        help_text = @program_logic.read_from_file(@program_logic.help_txt_path)
        print_array(help_text)
    end

    def carry_out_list
        # Processes the "list" command, which displays the user's to-do list
        # That is stored in @program_logic's list_path instance variable.
        the_list = @program_logic.read_from_file(@program_logic.list_path)

        puts "Your to-do list: "

        print_array(the_list, "- ")
    end

    def carry_out_add
        # Processes the "add" command, which adds an item to the user's to-do list
        # that is stored at @program_logic's list_path instance variable.
        print "Enter your new task: "
        new_task = gets.chomp
        @program_logic.add_to_list_path_file(new_task)
        puts
        puts "Your task has been added!"
    end

    def carry_out_clear
        # Processes the "clear" command, which completely 
        # clears the user's to-do list
        puts "Clearing out your to-do list..."
        @program_logic.clear_list_path_file()
        puts
        puts "Finished!"
    end
end