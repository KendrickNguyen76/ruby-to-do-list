# This file contains all of the methods that handle the logic of the to-do app.

# Constants
HELP_PATH = "./help.txt"
EXAMPLE_LIST_PATH = "./example.txt"
VALID_COMMAND_HASH = {"HELP" => true, "EXIT" => true, "LIST" => true}
VALID_COMMAND_HASH.default = false

def is_valid_command(user_comm)
    # This method checks to see if the string given to it is a
    # valid command within VALID_COMMAND_HASH.
    return VALID_COMMAND_HASH[user_comm.upcase]
end

def read_from_file(file_path)
    # Needs to be given a string or Path representing a file path.
    # Reads from it, splits it according to the newlines, and
    # then returns all of it as an array.
    file_text = File.read(file_path).split("\n")
    return file_text
end

def process_exit
    # Returns the string "Thank you", which gets printed to end the program.
    return "Thank you!"
end

def process_help
    # Returns an array with the text from the help.txt file.
    return read_from_file(HELP_PATH)
end

def process_list
    # Returns an array with the text from the list.txt file, which
    # contains the user's list. As of right now, this will instead
    # be linked to example.txt, which will act as a default before
    # the final version.
    return read_from_file(EXAMPLE_LIST_PATH)
end