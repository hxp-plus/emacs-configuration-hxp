;; markdown-preview.el
;; author: hxp <hxp@hust.edu.cn>
;; version: 0.0.0

;; Install
;; put 'markdown-preview.el' to your load path (i.e. "~/.emacs.d/lisp/")
;; (add-to-list 'load-path "~/.emacs.d/lisp/")
;; (require 'markdown-preview-by-hxp')

;; markdown-live-preview

(provide 'markdown-preview-by-hxp)

(defun markdown-html (buffer)
  (princ (with-current-buffer buffer
    (format "<!DOCTYPE html><html><title>Markdown Preview by hxp</title><xmp theme=\"simplex\" style=\"display:none;\"> %s  </xmp><script src=\"/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
	 (current-buffer)))



(defun async-shell-command-no-window
    (command)
  (interactive)
  (let
      ((display-buffer-alist
        (list
         (cons
          "\\*Async Shell Command\\*.*"
          (cons #'display-buffer-no-window nil)))))
    (async-shell-command
     command)))

(defun browse-url-windows (url &optional new-window)
      (async-shell-command-no-window
       (concat "\"C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe \" --new-window " url)))
(defun browse-url-linux (url &optional new-window)
      (async-shell-command-no-window
       (concat "google-chrome-stable --new-window " url)))


(defun markdown-preview-like-god ()
  (interactive)
  (impatient-mode 1)
  (setq imp-user-filter #'markdown-html)
  (cl-incf imp-last-state)
  (setq httpd-root "~/.emacs.d/httpd")
  (httpd-start)
  (require 'browse-url)
  ;; check OS type
  (cond
   ((string-equal system-type "windows-nt") ; Microsoft Windows
    (progn
      (setq browse-url-browser-function 'browse-url-windows)))
   ((string-equal system-type "darwin") ; Mac OS X
    (progn
      (message "Mac OS X")))
   ((string-equal system-type "gnu/linux") ; linux
    (progn
      (setq browse-url-browser-function 'browse-url-linux))))
  (browse-url "http://localhost:8080/imp/")
  )


;; Use C-c to preview
(add-hook 'markdown-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c p") 'markdown-preview-like-god)))

