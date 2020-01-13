# Xiping Hu's Emacs Configuration File #

### on-the-fly spell checking with hunspell ###

* install hunspell

	`sudo pacman -S hunspell hunspell-en_US`

* Personal Dictionary is located in `dict/dict.txt`
	
### Supports LaTeX ###
  * AUCTeX and CDLaTeX
  * Preview with pdf-tools
  * Compile with auctex
  * Customizing templates by yasnippet
  * auto-completion
  
### Markdown ###
  * preview-lively with [strapdown.js](http://strapdownjs.com/) and [markdown-preview-by-hxp](https://github.com/XipingHu/markdown-preview-by-hxp.git)
	* Files are saved offline, no internet connection is required
  * Usage
      * `C-c p` to preview in FireFox
	

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

### Git support with Magit ###
* [Magit Manual](https://www.emacswiki.org/emacs/Magit)
* `M-x magit-status`or `C-c g` to open the git window
  * `?` to show help
  * `s` to stage file
  * `u` to unstage
  * `c c` to commit
  * `P` to push
  * `F` to pull
  
### Journal and Todo with org-mode ###
  * press `C-c c`
  * journal and todo are located in `~/.emacs.d/doc/org`



* Backup your own ~/.emacs.d/
* Put all of the files here to ~/.emacs.d/

