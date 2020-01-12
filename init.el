;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d75b09e9a0760034d871fde1ef96b55826d63dafef577d14a01b690764c851e9" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "ba913d12adb68e9dadf1f43e6afa8e46c4822bb96a289d5bf1204344064f041e" default)))
 '(inhibit-startup-screen t)
 '(ispell-personal-dictionary "~/.emacs.d/dict/dict.txt")
 '(latex-block-names nil)
 '(package-archives
   (quote
    (("melpa-stable" . "https://stable.melpa.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (web-mode anaconda-mode magit py-autopep8 flycheck elpygen org-link-minor-mode impatient-mode flymd auctex gnu-elpa-keyring-update dracula-theme list-packages-ext elpy python-django django-mode markdown-mode yasnippet-snippets pdf-tools ac-math company-math auto-complete-auctex constant-theme cdlatex)))
 '(preview-gs-options
   (quote
    ("-q" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4" "-dNOSAFER")))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(preview-face ((t nil)))
 '(preview-reference-face ((t nil))))

;; LaTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-engine 'xetex)
    
;; Load pdf-tools to view LaTeX
(pdf-tools-install)

;; correlate for LaTeX
(setq TeX-source-correlate-mode t)

;; Use pdf-tools to open PDF files
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
 	TeX-source-correlate-start-server t)

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
(setq-default ispell-program-name "hunspell")
(setq ispell-local-dictionary "en_US") 
(setq ispell-local-dictionary-alist
      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(setq package-check-signature nil)

;; markdown-live-preview
(defun markdown-html (buffer)
  (princ (with-current-buffer buffer
    (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
  (current-buffer)))

(defun markdown-preview-like-god ()
  (interactive)
  (impatient-mode 1)
  (setq imp-user-filter #'markdown-html)
  (cl-incf imp-last-state)
  (httpd-start)
  (require 'browse-url)
  (setq browse-url-browser-function 'browse-url-firefox)
  (browse-url "http://localhost:8080/imp/")
  )

;; Use C-c to preview
(add-hook 'markdown-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c p") 'markdown-preview-like-god)))

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

;; Load theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-hook 'LaTeX-mode-hook
  (lambda ()
    (load-theme 'whiteboard)))
(load-theme 'dracula t)

;; Set font
(set-frame-font "hack" nil t)
