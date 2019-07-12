


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
    ("ba913d12adb68e9dadf1f43e6afa8e46c4822bb96a289d5bf1204344064f041e" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (flymd yasnippet-snippets pdf-tools ac-math company-math auto-complete-auctex constant-theme cdlatex auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
;; (load-theme 'constant)

;;Load pdff-tools
(pdf-tools-install)

;; correlate
(setq TeX-source-correlate-mode t)

;; Use pdf-tools to open PDF files
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
	TeX-source-correlate-start-server t)

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
           #'TeX-revert-document-buffer)

;; Use CDLaTeX
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

;; Show line numbers
;; (global-linum-mode t)

;; Enable yasnippet
(yas-global-mode t)

;; Configueing flyme preview with firefox
(defun my-flymd-browser-function (url)
   (let ((browse-url-browser-function 'browse-url-firefox))
     (browse-url url)))
 (setq flymd-browser-open-function 'my-flymd-browser-function)
