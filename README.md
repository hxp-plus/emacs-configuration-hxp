# Xiping Hu's Emacs Configuration File

### on-the-fly spell checking with hunspell

* install hunspell

	`sudo pacman -S hunspell hunspell-en_US`

* Personal Dictionary is located in `dict/dict.txt`
	
### Supports LaTeX
  * AUCTeX and CDLaTeX
  * Preview with pdf-tools
  * Compile with auctex
  * Customizing templates by yasnippet
  * auto-completion
  
### Markdown
  * preview-lively with impatient mode
  * Usage
    * `M-x markdown-preview-like-god`
	* `M-x httpd-start`
	* Visit [localhost:8080/imp](localhost:8080/imp) in your browser
	
### Python
* elpy
* Syntax checking with flycheck
  * flake8 is required:`sudo pip install flake8`
* autopep8

### Journal and Todo with org-mode
  * press `C-c c`
  * journal and todo are located in `~/.emacs.d/doc/org`

# How to use

* Backup your own ~/.emacs.d/
* Put all of the files here to ~/.emacs.d/


