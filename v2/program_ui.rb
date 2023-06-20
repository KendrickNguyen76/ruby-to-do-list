# This file contains the ProgramUI class, which is responsible
# for displaying the to-do app in the terminal.

class ProgramUI

    def initialize 
        start_up_page()
    end

    def start_up_page
        puts "Welcome to your to-do list (new and improved)"
        puts "Please input HELP for access to basic commands"
        print_divider()
    end

    def print_divider
        # Prints a long line of "=" which acts as a divider
        100.times {puts "="}
    end
end