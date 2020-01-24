;; the following is copied from http://lists.gnu.org/archive/html/help-gnu-emacs/2005-01/msg00636.html
(defvar messaging-on t
  "Control whether or not messages will be printed; by default, they are.")

;; Note that by itself this renders edebug pretty useless.
(defadvice message (around nomessage activate)
  "Turn off messaging most of the time.
Whether or not messages are displayed is determined by the value
of the variable `messaging-on'."
  (when messaging-on
    ad-do-it))

;; This is what is needed to make edebug work even
;; when the `nomessage' advice is in effect.
(defadvice edebug-previous-result (around override-nomessage activate)
  "Make edebug work when messaging is turned off by default."
  (let ((messaging-on t))
    ad-do-it))

(defadvice write-region (around no-wrote-file activate)
  "Turn off the printout associated with writing files.
This is necessary to add as a supplement to `nomessage' because
the \"Wrote file\" message is not printed through the `message'
mechanism.  The observed effect of this piece of advice is that
neither `save-buffer' nor `write-file' will print anything out
when they run."
  (if messaging-on
      ad-do-it
    (set-buffer-modified-p nil)
    (ad-set-arg 4 1)
    (ad-set-arg 6 nil)
    ad-do-it))

(defun turn-messaging-off ()
  (interactive)
  (ad-enable-advice 'message 'around 'nomessage)
  (ad-activate 'message)
  (ad-enable-advice 'write-region 'around 'no-wrote-file)
  (ad-activate 'write-region))

(defun turn-messaging-on ()
  (interactive)
  (ad-disable-advice 'message 'around 'nomessage)
  (ad-activate 'message)
  (ad-disable-advice 'write-region 'around 'no-wrote-file)
  (ad-activate 'write-region))

(defun my-message (str)
  "Send a message, overriding our usual advice."
  (let ((messaging-on t))
    (message str)))

(provide 'turn-off-messaging)