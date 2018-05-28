(require 'sly)
(require 'sly-company)
(require 'sly-macrostep)
(require 'sly-repl-ansi-color)
(require 'sly-quicklisp)

(push 'sly-repl-ansi-color sly-contribs)

(add-hook 'sly-mode-hook  'rainbow-delimiters-mode)
(add-hook 'sly-mode-hook 'sly-company-mode)
(add-hook 'sly-mode-hook 'enable-paredit-mode)
(add-to-list 'company-backends 'sly-company)


(eval-after-load 'sly-mrepl
   `(define-key sly-mrepl-mode-map (kbd "C-c C-k")
                'sly-mrepl-clear-repl))

