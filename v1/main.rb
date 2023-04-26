# main thing to run the to-do app in the terminal. Not much here yet, but we'll see
# what happens lmao.

# Constants
UI_PATH = "./to_do_ui.rb"

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