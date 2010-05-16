;;; starter-kit-autocomplete.el --- Some helpful Autocomplete helpers
;;
;; NOT Part of the Emacs Starter Kit

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; use M-n/M-p to select candidates
(define-key ac-completing-map (kbd "M-n") 'ac-next)
(define-key ac-completing-map (kbd "M-p") 'ac-previous)

;; don't start till some characters have been entered
(setq ac-auto-start 4)

;; map auto-complete trigger on TAB
(ac-set-trigger-key "TAB")

(provide 'starter-kit-autocomplete)
;;; starter-kit-autocomplete.el ends here
