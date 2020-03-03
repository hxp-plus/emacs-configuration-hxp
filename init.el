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
   (quote
    ("d75b09e9a0760034d871fde1ef96b55826d63dafef577d14a01b690764c851e9" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "ba913d12adb68e9dadf1f43e6afa8e46c4822bb96a289d5bf1204344064f041e" default)))
 '(inhibit-startup-screen t)
 '(ispell-personal-dictionary "~/.emacs.d/dict/dict.txt")
 '(latex-block-names nil)
 '(package-selected-packages
   (quote
    (helm-projectile flycheck-rtags company-rtags helm-rtags rtags irony-eldoc flycheck-irony company-irony-c-headers company-irony company-c-headers exec-path-from-shell go-autocomplete go-mode evil smartparens dockerfile-mode nasm-mode markdown-preview-eww neotree ac-python ac-html-csswatcher ac-html-bootstrap ac-html-angular ac-html ac-ispell ac-octave matlab-mode jedi ein auctex xref-js2 js2-refactor js2-mode cnfonts web-mode anaconda-mode magit py-autopep8 flycheck elpygen org-link-minor-mode impatient-mode flymd gnu-elpa-keyring-update dracula-theme list-packages-ext elpy python-django django-mode markdown-mode yasnippet-snippets pdf-tools ac-math company-math auto-complete-auctex constant-theme cdlatex)))
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

;; Chinese Support
(cnfonts-enable)

;; Smart parens
(smartparens-global-mode)

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

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Python
(add-hook 'python-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c C-c") 'python-shell-send-buffer)))

;; Load theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-hook 'LaTeX-mode-hook
  (lambda ()
    (load-theme 'whiteboard)))
(load-theme 'dracula t)

;; Evil mode
(evil-mode 1)
(define-key evil-motion-state-map "h" nil)
(define-key evil-motion-state-map "j" nil)
(define-key evil-motion-state-map "k" nil)
(define-key evil-motion-state-map "l" nil)
(define-key evil-motion-state-map "h" 'evil-backward-char)
(define-key evil-motion-state-map "t" 'evil-next-line)
(define-key evil-motion-state-map "n" 'evil-previous-line)
(define-key evil-motion-state-map "s" 'evil-forward-char)
(define-key evil-normal-state-map "s" nil)

(require 'req-package)
(req-package company
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
    (setq company-idle-delay 0)))

(req-package flycheck
  :config
  (progn
    (global-flycheck-mode)))

(req-package irony
  :config
  (progn
    ;; If irony server was never installed, install it.
    (unless (irony--find-server-executable) (call-interactively #'irony-install-server))

    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)

    ;; Use compilation database first, clang_complete as fallback.
    (setq-default irony-cdb-compilation-databases '(irony-cdb-libclang
                                                      irony-cdb-clang-complete))

    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  ))

  ;; I use irony with company to get code completion.
  (req-package company-irony
    :require company irony
    :config
    (progn
      (eval-after-load 'company '(add-to-list 'company-backends 'company-irony))))

  ;; I use irony with flycheck to get real-time syntax checking.
  (req-package flycheck-irony
    :require flycheck irony
    :config
    (progn
      (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))))

  ;; Eldoc shows argument list of the function you are currently writing in the echo area.
  (req-package irony-eldoc
    :require eldoc irony
    :config
    (progn
      (add-hook 'irony-mode-hook #'irony-eldoc)))


(req-package rtags
  :config
  (progn
    (unless (rtags-executable-find "rc") (error "Binary rc is not installed!"))
    (unless (rtags-executable-find "rdm") (error "Binary rdm is not installed!"))

    (define-key c-mode-base-map (kbd "M-.") 'rtags-find-symbol-at-point)
    (define-key c-mode-base-map (kbd "M-,") 'rtags-find-references-at-point)
    (define-key c-mode-base-map (kbd "M-?") 'rtags-display-summary)
    (rtags-enable-standard-keybindings)

    (setq rtags-use-helm t)

    ;; Shutdown rdm when leaving emacs.
    (add-hook 'kill-emacs-hook 'rtags-quit-rdm)
    ))

;; TODO: Has no coloring! How can I get coloring?
(req-package helm-rtags
  :require helm rtags
  :config
  (progn
    (setq rtags-display-result-backend 'helm)
    ))

;; Use rtags for auto-completion.
(req-package company-rtags
  :require company rtags
  :config
  (progn
    (setq rtags-autostart-diagnostics t)
    (rtags-diagnostics)
    (setq rtags-completions-enabled t)
    (push 'company-rtags company-backends)
    ))

;; Live code checking.
(req-package flycheck-rtags
  :require flycheck rtags
  :config
  (progn
    ;; ensure that we use only rtags checking
    ;; https://github.com/Andersbakken/rtags#optional-1
    (defun setup-flycheck-rtags ()
      (flycheck-select-checker 'rtags)
      (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
      (setq-local flycheck-check-syntax-automatically nil)
      (rtags-set-periodic-reparse-timeout 2.0)  ;; Run flycheck 2 seconds after being idle.
      )
    (add-hook 'c-mode-hook #'setup-flycheck-rtags)
    (add-hook 'c++-mode-hook #'setup-flycheck-rtags)
    ))

(req-package projectile
  :config
  (progn
    (projectile-global-mode)
    ))

;; Helm makes searching for anything nicer.
;; It works on top of many other commands / packages and gives them nice, flexible UI.
(req-package helm
  :config
  (progn
    (require 'helm-config)

    ;; Use C-c h instead of default C-x c, it makes more sense.
    (global-set-key (kbd "C-c h") 'helm-command-prefix)
    (global-unset-key (kbd "C-x c"))

    (setq
     ;; move to end or beginning of source when reaching top or bottom of source.
     helm-move-to-line-cycle-in-source t
     ;; search for library in `require' and `declare-function' sexp.
     helm-ff-search-library-in-sexp t
     ;; scroll 8 lines other window using M-<next>/M-<prior>
     helm-scroll-amount 8
     helm-ff-file-name-history-use-recentf t
     helm-echo-input-in-header-line t)

    (global-set-key (kbd "M-x") 'helm-M-x)
    (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

    (global-set-key (kbd "C-x C-f") 'helm-find-files)

    (global-set-key (kbd "M-y") 'helm-show-kill-ring)

    (global-set-key (kbd "C-x b") 'helm-mini)
    (setq helm-buffers-fuzzy-matching t
          helm-recentf-fuzzy-match t)

    ;; TOOD: helm-semantic has not syntax coloring! How can I fix that?
    (setq helm-semantic-fuzzy-match t
          helm-imenu-fuzzy-match t)

    ;; Lists all occurences of a pattern in buffer.
    (global-set-key (kbd "C-c h o") 'helm-occur)

    (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

    ;; open helm buffer inside current window, not occupy whole other window
    (setq helm-split-window-in-side-p t)
    (setq helm-autoresize-max-height 50)
    (setq helm-autoresize-min-height 30)
    (helm-autoresize-mode 1)

    (helm-mode 1)
    ))

;; Use Helm in Projectile.
(req-package helm-projectile
  :require helm projectile
  :config
  (progn
    (setq projectile-completion-system 'helm)
    (helm-projectile-on)
    ))


