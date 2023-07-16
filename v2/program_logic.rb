# This file contains ProgramLogic, which is responsible for
# handling the logical bits of the to-do app.

require "pathname"

class ProgramLogic
    # Establish the different readable instance variables of
    # the ProgramLogic class/object
    attr_reader :list_path, :running, :help_txt_path

    def initialize(list_path)
        # Intialize one instance variable called @list_path, represents the path
        # to the file that contains our to-do list
        @running = true
        @list_path = Pathname.new(list_path)
        @help_txt_path = "./v2/help.txt"
    end

    def end_program
        # Ends the program by setting @running to false
        @running = false
    end

    def set_new_file_path(new_path)
        # Needs to be given a string that represents a file path
        # replaces the current @list_path with new_path
        @list_path = Pathname.new(new_path)
    end

    def read_from_file(file_path)
        # Needs to be given a file_path, reads the content
        # of it and stores it into an array which gets returned
        file_text = File.read(file_path).split("\n")
        return file_text
    end

    def add_to_list_path_file(text)
        # Needs to be given a string, which is the text that will be added to
        # the file at @list_path. A newline character will also be added.
        File.write(@list_path, text, mode: "a")
        File.write(@list_path, "\n", mode: "a")
    end

    def clear_list_path_file
        # Clears the @list_path file by writing an empty string to it.
        File.write(@list_path, "")
    end

    def remove_from_list_path_file(current_list, index)
        # Needs to be given an index. Reads from @list_path and makes an array
        # from it. Then deletes the item from the array at that index. Finally,
        # clear the file at @list_path, and writes the contents of the modified
        # array to it, giving the illusion of deleting an item from the to-do list.
        current_list.delete_at(index)

        clear_list_path_file()

        current_list.each {|item| add_to_list_path_file(item)}
    end
end