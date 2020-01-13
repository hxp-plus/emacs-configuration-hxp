;; markdown-preview.el
;; author: hxp <hxp@hust.odu.cn>
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


(defun browse-url-edge (url &optional new-window)
      (shell-command
       (concat "start microsoft-edge:" url)))


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
      (setq browse-url-browser-function 'browse-url-edge)))
   ((string-equal system-type "darwin") ; Mac OS X
    (progn
      (message "Mac OS X")))
   ((string-equal system-type "gnu/linux") ; linux
    (progn
      (setq browse-url-browser-function 'browse-url-firefox))))
  (browse-url "http://localhost:8080/imp/")
  )


;; Use C-c to preview
(add-hook 'markdown-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c p") 'markdown-preview-like-god)))

