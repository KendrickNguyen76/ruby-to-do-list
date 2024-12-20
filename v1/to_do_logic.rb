# This file contains all of the methods that handle the logic of the to-do app.

# Constants

# .txt File Paths
# These files need to be in the same directory as the .rb files, they are used
# for storing the list information and the information used by the help command.

HELP_PATH = "./v1/help.txt" # Text file containing the help information
EXAMPLE_LIST_PATH = "./v1/example.txt" # Text file containing an example of a finalized list
LIST_PATH = "./v1/list.txt" # Text file contianing the user's list. They can edit this 
# through various actions in the terminal application.

# Command Hash
# This hash contains all of the valid commands that the user can use.

VALID_COMMAND_HASH = {"HELP" => true, "EXIT" => true, 
                      "LIST" => true, "ADD" => true, 
                      "CLEAR" => true, "REMOVE" => true}
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

def add_to_file(file_path, message)
    # Needs to be given two strings: a file path and a message. Adds the message 
    # to the end of the file located at file_path. Also adds a new line.
    File.write(file_path, message, mode: "a")
    File.write(file_path, "\n", mode: "a")
end

def clear_the_file(file_path)
    # Needs to be given a string that represents a file. Writes the empty string
    # to that file in order to clear it out (I think).
    File.write(file_path, "")
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
    # contains the user's list.
    return read_from_file(LIST_PATH)
end

def process_add(new_task)
    # This method takes one string, and writes it to the list.txt folder
    # in order to add it to their to-do list.
    add_to_file(LIST_PATH, new_task)
end

def process_clear
    # When this method gets called, it clears the list.txt file in order to clear
    # the user's to-do list.
    clear_the_file(LIST_PATH)
end

def process_remove(index)
    # Needs to be given an index. Reads from the list.txt file, 
    #creates an array out of that, and then removes the item at that index. 
    # Then writes the updated array back to the file.
    current_list = read_from_file(LIST_PATH)
    current_list.delete_at(index)

    clear_the_file(LIST_PATH)

    current_list.each {|item| add_to_file(LIST_PATH, item)}
end