;;; starter-kit-js.el --- Some helpful Javascript helpers
;;
;; Part of the Emacs Starter Kit

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-hook 'js-mode-hook 'moz-minor-mode)
(add-hook 'js-mode-hook 'esk-paredit-nonlisp)
(add-hook 'js-mode-hook 'run-coding-hook)
(setq js-indent-level 2)

;; Cosmetic

(defun pretty-functions ()
  (font-lock-add-keywords
   nil `(("(?\\(function\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1) "ƒ")
                    nil))))))
(add-hook 'coding-hook 'pretty-functions)


(eval-after-load 'js
  '(progn (define-key js-mode-map "{" 'paredit-open-brace)
          (define-key js-mode-map "}" 'paredit-close-brace-and-newline)
          ;; (define-key js-mode-map (kbd ",") 'self-insert-command)
          ))

(provide 'starter-kit-js)
;;; starter-kit-js.el ends here
