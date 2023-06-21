# This is the main file for running the to do app
# Call it in order to start the program.

# Constants
PROGRAM_UI_PATH = "./v2/program_ui.rb"

# Requirements
require PROGRAM_UI_PATH

def main
    # This function should be called in order to start up the program.
    program = ProgramUI.new()

    while (program.is_running?)
        a_command = program.ask_for_input()
        program.handle_input(a_command)
    end

    puts "Thank you for using our to-do app!"
    puts
end