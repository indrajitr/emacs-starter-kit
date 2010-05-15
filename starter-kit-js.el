;;; starter-kit-js.el --- Some helpful Javascript helpers
;;
;; Part of the Emacs Starter Kit

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-hook 'js-mode-hook 'moz-minor-mode)
(add-hook 'js-mode-hook 'esk-paredit-nonlisp)
(add-hook 'js-mode-hook 'run-coding-hook)
(setq js-indent-level 2)

(eval-after-load 'js
  '(progn (define-key js-mode-map "{" 'paredit-open-brace)
          (define-key js-mode-map "}" 'paredit-close-brace-and-newline)
          ;; fixes problem with pretty function font-lock
          (define-key js-mode-map (kbd ",") 'self-insert-command)
          (font-lock-add-keywords
           'js-mode `(("\\(function *\\)("
                             (0 (progn (compose-region (match-beginning 1)
                                                       (match-end 1) "ƒ")
                                       nil)))))))

(provide 'starter-kit-js)
;;; starter-kit-js.el ends here
