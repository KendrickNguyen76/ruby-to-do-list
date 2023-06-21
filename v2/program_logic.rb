# This file contains ProgramLogic, which is responsible for
# handling the logical bits of the to-do app.

require "pathname"

class ProgramLogic
    # Make @list_path readable/writable
    attr_accessor :list_path
    attr_reader :running

    # valid_commands stores all of the valid commands that can be used in
    # the to-do list program
    @@valid_commands = {"EXIT" => true}

    def initialize(list_path)
        # Intialize one instance variable called @list_path, represents the path
        # to the file that contains our to-do list
        @running = true
        @list_path = Pathname.new(list_path)
    end

    def end_program
        # Ends the program by setting @running to false
        @running = false
    end

    def is_valid_command?(input)
        # Checks to see if the input given to it is a valid command
        # within the @command hash. Returns true if it is, nil if it isn't, 
        # which is falsy.

        return @@valid_commands[input]
    end

    def handle_commands(input)
        # Responsible for taking the input given to it, and
        # executing a given set of instructiosn depending on
        # what it is. This method assumes input is a valid
        # command
        case input
            when "EXIT"
                end_program
        end
    end
end