Put this file in a folder where Emacs can find it.

Add following lines to your .emacs initialization file
to enable auto save in all programming modes.

    (require 'real-auto-save)
    (add-hook 'prog-mode-hook 'real-auto-save-mode)


Auto save interval is 10 seconds by default.
You can change it to whatever value you want at any point.

    (setq real-auto-save-interval 5) ;; in seconds


On Makefile, Emacs confirming really save every and every insert
<tab> to edit it.
Suppress this confirming, call `real-auto-save-activate-advice'
on your init.el

    (real-auto-save-activate-advice)

If disable this advice, call `real-auto-save-remove-advice'.
