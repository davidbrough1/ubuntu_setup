Documentation to setup my environment.

1. Copy all hidden files to ~.
    cp .dircolors .gitconfig .bashrc ~
2. Install Terminator and change to settings in terminator_settings.txt
3. Install Sublime Text 3 and Package Manager and download packages
   in sublime_packages.txt.
4. Copt sublime setting files to user directory.
    cp Preferences.sublime-settings Python.sublime-settings ~/.config/sublime-text-3/Packages/Users
5. Create env directory in the git directory and copy commit-template to env
    cp commit-template ~/git/env/
6. Install spell checker for ipython notebook https://github.com/damianavila/mIPyex