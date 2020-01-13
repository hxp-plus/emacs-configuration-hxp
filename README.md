# Xiping Hu's Emacs Configuration File #

## Installation Guide ##

### Install Emacs Configuration File ###

#### Linux ####

* Backup your own ~/.emacs.d/
* Put all of the files here to ~/.emacs.d/

#### Windows 10 ####

* Backup your own Emacs configuration folder `.emacs.d`
  * Default location is in `C:\Users\<Your Username>\AppData\Roaming\.emacs.d`
  * Note that this folder is hidden by default, and it won't exist until you run Emacs once.
  * [How to show hidden files in Windows](https://www.wikihow.com/Show-Hidden-Files-and-Folders-in-Windows)
  
* Empty `.emacs.d` and put all the files here in `.emacs.d`

### Install Hack font ###

#### Linux ####
* Hack font is pre-installed in many Linux distributions such as Arch Linux and Kali Linux
* If the Hack font is not installed, follow [this guide](https://github.com/source-foundry/hack-linux-installer) to install one

#### Windows 10 ####
* Just run the installer `HackFontsWindowsInstaller.exe` in `dependencies` folder and **reboot**

### Install hunspell spell checking system ###

#### Linux ####
* Use your package manager, for example, in Arch Linux, run `sudo pacman -S hunspell hunspell-en_US`

#### Windows 10 ####
* Install [Msys2 64bit](https://www.msys2.org/) by running the installer `msys2-x86_64-20190524.exe` in `dependencies` folder. Use the default installation directory.
* Use [TUNA Mirror](https://mirrors.tuna.tsinghua.edu.cn/help/msys2/) to download
  * Replace the 3 files in `C:\msys64\etc\pacman.d\` with the 3 files in `dependencies/msys2 mirror` folder, due to network problem in mainland China
* Start `msys2.exe` and run `pacman -S mingw-w64-x86_64-hunspell mingw-w64-x86_64-hunspell-en`
  * `msys2.exe` is located in `C:\msys64\`
  * Sometimes the installation may fail, doesn't matter, run it for one more time.
  
### Install SumatraPDF ###

#### Linux ####
* SumatraPDF is not needed on Linux cause we can use pdf-tools

#### Windows 10 ####
* Run `SumatraPDF-3.1.2-64-install.exe` in `dependencies` folder. Use the default installation directory.
* Add Environment Variable `c:/Program Files/SumatraPDF` to `PATH`
  * [How to add Path on Windows 10](https://www.wikihow.tech/Add-Path-on-Windows)

### Install Chrome ###

#### Linux ####
* Make sure your command for chrome is `google-chrome-stable`

#### Windows 10 ####
* Make sure your chrome is installed in the default directory `C:/Program Files(x86)`


## Features ##

### Spell Checking ###

* Spell checking is performed as you are typing.
* Personal Dictionary is located in `.emacs.d/dict/dict.txt`
* Misspelled word will be underlined red in Emacs.
* Move the cursor on the misspelled word and press `M-$` for further actions
  * You can either replace it by pressing numbers above or press `i` to add it in your personal dictionary, or press `?` for help.
  
### Magit integration ###
* `C-c g` is bound with the command `magit-status`
* `M-x magit-status`or `C-c g` to open the git window
  * `?` to show help
  * `s` to stage file
  * `u` to unstage
  * `c c` to commit
  * `P` to push
  * `F` to pull
* [A quick guide of Magit](https://www.emacswiki.org/emacs/Magit)


### LaTeX ###

#### AUCTeX: Basic support for LaTeX ####
* Use `C-c C-c` to Compile and View LaTeX
  * the default TeX engine is XeTeX
  * Auto-Launch pdf viewer to View (After pressing `C-c C-c RET` to run command `LaTeX` to compile, press `C-c C-c` again to run the `View` command.
  * Use shortcut like `C-c C-s` and `C-c C-e` to insert sections and environments quickly.
	* **Remember to press `C-c C-n` after importing ams packages to reset buffer**
  * Preview LaTeX (Not recommended)
  * See also: [EmacsWiki](https://www.emacswiki.org/emacs/AUCTeX)
  
#### CDLaTeX: Increasing input speed ####
* Try to press <code>`</code> and <code>'</code> to insert Greek letters and styles quickly.
* See Also: <https://github.com/cdominik/cdlatex>


### Markdown ###
  * preview-lively with [strapdown.js](http://strapdownjs.com/) and [markdown-preview-by-hxp](https://github.com/XipingHu/markdown-preview-by-hxp.git)
	* Files are saved offline, no internet connection is required
  * Usage
      * `C-c p` to preview in Firefox (Linux) or Microsoft Edge (Windows 10)
	

### Python ###
* Edit and Debug with [elpy](https://github.com/jorgenschaefer/elpy)
* Syntax checking with flycheck
  * flake8 is required:`sudo pip install flake8`
* autopep8
* [anaconda-mode](https://github.com/pythonic-emacs/anaconda-mode)


### Django ###
* [python-django](https://github.com/fgallina/python-django.el)
* [web-mode](https://github.com/fxbois/web-mode)
* [django-mode](https://github.com/myfreeweb/django-mode)

  
### Journal and Todo with org-mode ###
  * press `C-c c`
  * journal and todo are located in `.emacs.d/doc/org`


