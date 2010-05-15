;;; starter-kit-xml.el --- Some helpful Javascript helpers
;;
;; NOT Part of the Emacs Starter Kit

(add-hook 'nxml-mode-hook 'esk-paredit-nonlisp)
(add-hook 'nxml-mode-hook 'run-coding-hook)

(eval-after-load 'nxml-mode
  '(progn (define-key nxml-mode-map "{" 'paredit-open-brace)
          (define-key nxml-mode-map "<" 'paredit-open-brocket)
          ; (define-key xml-mode-map ">" 'paredit-close-brocket-and-newline)
          ))

(provide 'starter-kit-xml)
;;; starter-kit-xml.el ends here
