(require 'lisp-mode)

;; paredit-mode for lisp
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
;; This is useful for working with camel-case tokens,
(add-hook 'lisp-mode-hook 'subword-mode)
(add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)
;;(add-hook 'lisp-mode-hook 'global-auto-complete-mode)

;;(add-hook 'lisp-mode-hook 'ac-sly)
(add-hook 'lisp-mode-hook 'undo-tree)
(require 'clojure-mode-extra-font-locking)

(add-hook 'lisp-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
               ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 1))))


(setq inferior-lisp-program "/usr/bin/sbcl")                                    
(require 'sly-autoloads)

