(require 'lisp-mode)
;;(load "~/.emacs.d/customizations/langs/slime-repl-ansi-color.elc")
(require 'slime-autoloads)
;; paredit-mode for lisp
(add-hook 'lisp-mode-hook 'paredit-mode)
;; This is useful for working with camel-case tokens,
(add-hook 'lisp-mode-hook 'subword-mode)
(add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)
;;(add-hook 'lisp-mode-hook 'slime-company-mode)
(add-hook 'lisp-mode-hook 'global-autocomplete-mode)
(add-hook 'lisp-mode-hook 'ac-slime)
(add-hook 'lisp-mode-hook 'slime-mode)
(add-hook 'lisp-mode-hook 'set-up-slime-ac)
(add-hook 'lisp-mode-hook 'undo-tree-mode)
(require 'clojure-mode-extra-font-locking)

;; (add-hook 'lisp-mode-hook
;;           (lambda ()
;;             (font-lock-add-keywords
;;              nil
;;              '(("(\\(facts?\\)"
;;                 (1 font-lock-keyword-face))
;;                ("(\\(background?\\)"
;;                 (1 font-lock-keyword-face))))
;;             (define-clojure-indent (fact 1))
;;             (define-clojure-indent (facts 1))))


(setq inferior-lisp-program "/usr/local/bin/sbcl")                                    
(setq slime-contribs '(slime-fancy))


;;(slime-setup '(slime-fancy slime-repl-ansi-color))
(add-hook 'slime-repl-mode-hook 'paredit-mode)
(add-hook 'slime-repl-mode-hook 'undo-tree-mode)
;; This is useful for working with camel-case tokens,
(add-hook 'slime-repl-mode-hook 'subword-mode)
(add-hook 'slime-repl-mode-hook #'rainbow-delimiters-mode)
(add-hook 'slime-repl-mode-hook 'global-auto-complete-mode)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

(require 'clojure-mode-extra-font-locking)

;; (add-hook 'slime-repl-mode-hook
;;           (lambda ()
;;             (font-lock-add-keywords
;;              nil
;;              '(("(\\(facts?\\)"
;;                 (1 font-lock-keyword-face))
;;                ("(\\(background?\\)"
;;                 (1 font-lock-keyword-face))))
;;             (define-clojure-indent (fact 1))
;;             (define-clojure-indent (facts 1))))

;;(global-set-key (kbd "C-c C-c") 'slime-compile-defun)




