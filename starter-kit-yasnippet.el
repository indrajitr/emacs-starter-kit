;;; starter-kit-yasnippet.el --- Helpful Yasnippet helpers
;;
;; NOT Part of the Emacs Starter Kit

(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "vendor/yasnippet/snippets"))

(provide 'starter-kit-yasnippet)
;;; starter-kit-yasnippet.el ends here
