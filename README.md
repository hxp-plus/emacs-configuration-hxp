# Hu Xiping's emacs configuration

* Supports LaTeX
  
  * Preview with pdf-tools
  * Compile with auctex
  * Customizing templates by yasnippet

* Supports markdown
  
  * preview with markdown-mode
  
  * Tutorials:
      [Edit](http://panqiincs.me/2015/06/15/edit-markdown-with-emacs/)
      [Preview](https://panqiincs.me/2015/07/31/preview-markdown-with-emacs/)
    
      Note that you need to install pandoc, create a file named "markdown", add "pandoc -f markdown -t html -s --mathjax --highlight-style pygments $1" into the file. Then copy it into /usr/bin/ directory and give it the execute permission(chmod +x).

# How to use

* Backup your own ~/.emacs.d/
* Put all of the files here to ~/.emacs.d/
* Install AucTeX (M-x list-packages)


