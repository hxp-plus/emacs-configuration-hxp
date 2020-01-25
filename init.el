(require 'package)

;; Use the tuna mirror
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("melpa stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
			 ("marmalade" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d75b09e9a0760034d871fde1ef96b55826d63dafef577d14a01b690764c851e9" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "ba913d12adb68e9dadf1f43e6afa8e46c4822bb96a289d5bf1204344064f041e" default))
 '(inhibit-startup-screen t)
 '(ispell-personal-dictionary "~/.emacs.d/dict/dict.txt")
 '(latex-block-names nil)
 '(package-selected-packages
   '(nasm-mode real-auto-save markdown-preview-eww neotree ac-python ac-html-csswatcher ac-html-bootstrap ac-html-angular ac-html ac-ispell ac-octave matlab-mode jedi ein auctex xref-js2 js2-refactor js2-mode cnfonts web-mode anaconda-mode magit py-autopep8 flycheck elpygen org-link-minor-mode impatient-mode flymd gnu-elpa-keyring-update dracula-theme list-packages-ext elpy python-django django-mode markdown-mode yasnippet-snippets pdf-tools ac-math company-math auto-complete-auctex constant-theme cdlatex))
 '(preview-gs-options
   '("-q" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4" "-dNOSAFER"))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(preview-face ((t nil)))
 '(preview-reference-face ((t nil))))

;; Chinese Support
(cnfonts-enable)

;; Auto save on buffer changes
(add-hook 'prog-mode-hook 'real-auto-save-mode)
(add-hook 'text-mode-hook 'real-auto-save-mode)
(setq real-auto-save-interval 0.01)  ;; You need to use hxp version of emacs to get rid of the saving message

;; LaTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-engine 'xetex)
    
;; Load pdf-tools to view LaTeX (Linux only)
;; check OS type
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (message "pdf-tools is not supported in Microsoft Windows")))
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (message "pdf-tools is not supported in Mac OS X")))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (pdf-tools-install))))


;; correlate for LaTeX
(setq TeX-source-correlate-mode t)

;; Set TeX view program
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (setq TeX-view-program-selection '((output-pdf "SumatraPDF")))))
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (message "not supported in Mac OS X")))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
	  TeX-source-correlate-start-server t))))

;; Open PDF files
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (setq TeX-view-program-selection '((output-pdf "SumatraPDF")))))
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (message "not supported in Mac OS X")))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t))))


;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
           #'TeX-revert-document-buffer)

;; Use CDLaTeX
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

;; Enable yasnippet
(yas-global-mode t)

;; Enable auto-complete
(add-hook 'text-mode-hook 'auto-complete-mode)
(add-hook 'prog-mode-hook 'auto-complete-mode)

;; Spell Check

(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (setq-default ispell-program-name "C:/msys64/mingw64/bin/hunspell.exe")))
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (message "not supported in Mac OS X")))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (setq-default ispell-program-name "hunspell"))))

(setq ispell-local-dictionary "en_US") 
(setq ispell-local-dictionary-alist
      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(setq package-check-signature nil)

;; markdown-live-preview
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'markdown-preview-by-hxp)
(require 'turn-off-messaging)

;; Enable elpy whenever python file is loaded 
(add-hook 'python-mode-hook(
    (lambda()
      (elpy-enable))))

;; Enable hideshow when python or Emacs-lisp is loaded
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)


;; Enable Flycheck for python
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable autopep8 for python
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; anaconda-mode for python
(add-hook 'python-mode-hook 'anaconda-mode)

;; org-capture
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/doc/org/task.org" "Tasks")
         "* TODO %?\n %i\n %a")
        ("j" "Journal" entry (file+datetree "~/.emacs.d/doc/org/journal.org")
         "* %?\nEntered on %U\n %i\n %a")))
;; NASM-mode
(add-hook 'asm-mode-hook 'nasm-mode)


;; Octave-mode
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))
(add-hook 'inferior-octave-mode-hook
          (lambda ()
            (turn-on-font-lock)
            (define-key inferior-octave-mode-map [up]
              'comint-previous-input)
            (define-key inferior-octave-mode-map [down]
              'comint-next-input)))
;; gnuserv
(autoload 'octave-help "octave-hlp" nil t)
(require 'gnuserv)
(gnuserv-start)


;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Load theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-hook 'LaTeX-mode-hook
  (lambda ()
    (load-theme 'whiteboard)))
(load-theme 'dracula t)

