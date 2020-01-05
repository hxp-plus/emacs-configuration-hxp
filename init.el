


;; melpa
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
    (auctex gnu-elpa-keyring-update dracula-theme list-packages-ext elpy python-django django-mode markdown-mode yasnippet-snippets pdf-tools ac-math company-math auto-complete-auctex constant-theme cdlatex)))
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

(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-engine 'xetex)

;; (load-theme 'constant)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-hook 'LaTeX-mode-hook
  (lambda ()
    (load-theme 'whiteboard)))
    
;; Load pdf-tools
;; (pdf-tools-install)

;; correlate
(setq TeX-source-correlate-mode t)

;; Use pdf-tools to open PDF files
;; (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
;; 	TeX-source-correlate-start-server t)

;; Use pdf-tools to open PDF files
(setq TeX-view-program-selection '((output-pdf "Okular"))
	TeX-source-correlate-start-server t)

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
           #'TeX-revert-document-buffer)

;; Use CDLaTeX
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

;; Show line numbers
;; (global-linum-mode t)

;; Set font
(set-frame-font "hack" nil t)

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

;; Configueing flyme preview with firefox
(defun my-flymd-browser-function (url)
   (let ((browse-url-browser-function 'browse-url-firefox))
     (browse-url url)))
 (setq flymd-browser-open-function 'my-flymd-browser-function)

(load-theme 'dracula t)



(setq package-check-signature nil)
