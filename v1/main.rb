# main thing to run the to-do app in the terminal. Not much here yet, but we'll see
# what happens lmao.

# Note to self, if you want to run this, do ruby v1/main.rb
# The require statements have been adjusted so that it works this way
# In order to make it run while in the v1 folder, I would have to change
# it just ./<file_name>, but i already just made the change so i'm too 
# lazy to change it back lmao.

# Constants
UI_PATH = "./v1/to_do_ui.rb"

# Requirements
require UI_PATH

def main
    # This method gets called to start up the to-do app in the terminal.
    start_page()
    command = ""

    while (command != "EXIT")
        command = ask_for_command()
        get_command_processed(command)
    end
end

main()