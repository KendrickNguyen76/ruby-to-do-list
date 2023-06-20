# This file contains ProgramLogic, which is responsible for
# handling the logical bits of the to-do app.

require "pathname"

class ProgramLogic
    # Make @list_path readable/writable
    attr_accessor :list_path

    def initialize(list_path)
        # Intialize one instance variable called @list_path, represents the path
        # to the file that contains our to-do list
        @list_path = list_path
    end
end