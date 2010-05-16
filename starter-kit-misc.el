;;; starter-kit-misc.el --- Things that don't fit anywhere else
;;
;; Part of the Emacs Starter Kit

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  ; (tooltip-mode -1)
  ; (blink-cursor-mode -1)
  )

(add-hook 'before-make-frame-hook 'turn-off-tool-bar)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
; (ansi-color-for-comint-mode-on)

(setq inhibit-startup-message t
      ; transient-mark-mode t
      ; color-theme-is-global t
      ; shift-select-mode nil
      require-final-newline t
      uniquify-buffer-name-style 'forward
      ; whitespace-style '(trailing lines space-before-tab
      ;                             indentation space-after-tab)
      whitespace-line-column 100
      oddmuse-directory (concat dotfiles-dir "oddmuse") ; ??
      )

;; Stuff not necessary (or different) in Aquamacs but nice to have otherwise
(unless (boundp 'aquamacs-version)
  (setq mouse-wheel-mode t
        xterm-mouse-mode t
        visible-bell t
        echo-keystrokes 0.1
        font-lock-maximum-decoration t
        mouse-yank-at-point t
        truncate-partial-width-windows nil
        ediff-window-setup-function 'ediff-setup-windows-plain
        save-place-file (concat dotfiles-dir "places")))

; (add-hook 'text-mode-hook 'linum-mode)
(global-linum-mode t)
; (setq linum-format (
;   lambda (line) (
;     propertize (format (
;       let ((w (length (number-to-string (count-lines (point-min) (point-max)))))) (concat "%" (number-to-string w) "d ")) line) 'face 'linum)))
(setq linum-format "%5d ")

;; Set this to whatever browser you use
;; (setq browse-url-browser-function 'browse-url-firefox)
;; (setq browse-url-browser-function 'browse-default-macosx-browser)
;; (setq browse-url-browser-function 'browse-default-windows-browser)
;; (setq browse-url-browser-function 'browse-default-kde)
;; (setq browse-url-browser-function 'browse-default-epiphany)
;; (setq browse-url-browser-function 'browse-default-w3m)
;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "~/src/conkeror/conkeror")

;; Transparently open compressed files
(unless (boundp 'aquamacs-version) ; not necessary for Aquamacs
  (auto-compression-mode t))

;; Enable syntax highlighting for older Emacsen that have it off
(unless (boundp 'aquamacs-version) ; not necessary for Aquamacs
  (global-font-lock-mode t))

;; Save a list of recent files visited.
(unless (boundp 'aquamacs-version) ; not necessary for Aquamacs
  (recentf-mode 1))

;; Highlight matching parentheses when the point is on them.
(unless (boundp 'aquamacs-version) ; not necessary for Aquamacs
  (show-paren-mode 1))

;; ido-mode is like magic pixie dust!
(when (> emacs-major-version 21)
  (ido-mode t)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-filename-at-point 'guess
        ido-max-prospects 10))

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

(defvar coding-hook nil
  "Hook that gets run on activation of any programming mode.")

(defalias 'yes-or-no-p 'y-or-n-p)
(random t) ;; Seed the random-number generator

;; Hippie expand: at times perhaps too hip
(delete 'try-expand-line hippie-expand-try-functions-list)
(delete 'try-expand-list hippie-expand-try-functions-list)

;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

;; nxhtml stuff
(setq mumamo-chunk-coloring 'submode-colored
      nxhtml-skip-welcome t
      indent-region-mode t
      rng-nxml-auto-validate-flag nil)

;; Associate modes with file extensions

(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

(eval-after-load 'grep
  '(progn
    (add-to-list 'grep-find-ignored-files "target")
    (add-to-list 'grep-find-ignored-files "*.class")))

;; Default to unified diffs
(setq diff-switches "-u")

;; Cosmetics

(set-face-background 'vertical-border "white")
(set-face-foreground 'vertical-border "white")

(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

(eval-after-load 'mumamo
  '(eval-after-load 'zenburn
     '(ignore-errors (set-face-background
                      'mumamo-background-chunk-submode "gray22"))))

;; Platform-specific stuff
(when (eq system-type 'darwin)
  ;; Work around a bug on OS X where system-name is FQDN
  (setq system-name (car (split-string system-name "\\."))))

;; make emacs use the clipboard
(unless (boundp 'aquamacs-version) ; not necessary for Aquamacs
  (setq x-select-enable-clipboard t))

;; Get around the emacswiki spam protection
(add-hook 'oddmuse-mode-hook
          (lambda ()
            (unless (string-match "question" oddmuse-post)
              (setq oddmuse-post (concat "uihnscuskc=1;" oddmuse-post)))))

(provide 'starter-kit-misc)
;;; starter-kit-misc.el ends here
