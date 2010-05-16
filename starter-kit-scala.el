;;; starter-kit-scala.el --- Helpful Scala helpers
;;
;; NOT Part of the Emacs Starter Kit

(require 'scala-mode-auto)
(add-hook 'scala-mode-hook 'esk-paredit-nonlisp)
(add-hook 'scala-mode-hook 'run-coding-hook)

; TODO: move to more common location
(require 'mvn)
(require 'sbt)

(provide 'starter-kit-scala)
;;; starter-kit-scala.el ends here
