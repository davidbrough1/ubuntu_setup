Documentation to setup my environment.

1. Copy all hidden files to home directory.

    `$ cp .dircolors .gitconfig .bashrc .git-completion.bash ~`

2. Install Terminator and change to settings in terminator_settings.txt
3. Install Sublime Text 3 and Package Manager and download packages
   in sublime_packages.txt.
4. Copy custom build systems

    `$ cp myC.sublime-build mpicc_4.sublime-build ~/.config/sublime-text-3/Packages/User`

5. Copy sublime setting files to user directory.

    `$ cp Preferences.sublime-settings Python.sublime-settings Python\ Django.sublime-settings Anaconda.sublime-settings ~/.config/sublime-text-3/Packages/Users`

6. Create env directory in the git directory and copy commit-template to the env directory

    `$ cp commit-template ~/git/env/`

7. Install spell checker for ipython notebook https://github.com/damianavila/mIPyex