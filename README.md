# My Dotfiles Installer

This repository contains a simple installer script for managing my personal dotfiles, which are stored as GitHub Gists. It uses soft links to connect the local Git repository to the installed dotfiles, allowing for easy editing and synchronization with the Gists.

**Note:** This repository is primarily intended for my personal use. While it's publicly available, it may not be suitable for general use due to its specific configurations and dependencies.

## Overview

The `dotfiles.sh` script automates the process of:

1.  Downloading dotfiles from specified GitHub Gists.
2.  Creating soft links in the appropriate locations within my home directory.
3.  Maintaining a local Git repository for easy editing and pushing updates back to the Gists.

This approach allows for centralized management of my dotfiles while keeping them accessible and editable within a Git repository.

## Usage

1.  **Run the Installer:**

    ```bash
    curl -s https://raw.githubusercontent.com/nobler1050/dotfiles/main/dotfiles.sh | bash
    ```

    * This command will download and execute the `dotfiles.sh` script, which will download the dotfiles from the Gists defined within the script and create the necessary soft links.

3.  **Editing and Updating:**

    * To edit a dotfile, simply modify the corresponding file within the `~/.dotfiles` repository.
    * To push changes back to the Gists:

        ```bash
        cd ~/.dotfiles
        git add .
        git commit -m "Update dotfiles"
        git push
        ```

    * The soft links will automatically reflect the changes made in the local repository.

## Gist Configuration

The `dotfiles.sh` script relies on a list of Gist URLs and their corresponding installation paths. You can modify the script to add or remove Gists as needed.

* The script specifically uses curl to download the raw content from the gists.

## Dependencies

* `git`
* `curl`
* `bash`
* A working internet connection.

## Notes

* This setup assumes that the user has the necessary permissions to create soft links in their home directory.
* The Gist URLs and installation paths are hardcoded within the `dotfiles.sh` script.
* The script is designed for my personal preferences and may require modifications to suit other users.
* The Gists that this script uses are not included in this repo, they are located on my github account.

## Contributing

As this is primarily a personal repository, contributions are not actively sought. However, if you have suggestions or improvements, feel free to open an issue or submit a pull request.

## License

(Add your license here, e.g., MIT, GPL, etc.)
