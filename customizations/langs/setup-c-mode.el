
(setq c-default-style "k&r"
      c-basic-offset 4
      indent-tabs-mode t
      c-tab-always-indent t)

(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))


(electric-pair-mode 1)

(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))

(setq company-backends
  '((company-complete
     company-c-headers)))

(add-to-list 'company-backends 'company-c-headers)
(add-hook 'c-mode-hook 'company-backends)
(add-hook 'c-mode-hook 'set-newline-and-indent)
(add-hook 'c-mode-common-hook 'highlight-numbers-mode)
(add-hook 'c-mode-common-hook 'global-company-mode)
;;(add-hook 'c-mode-common-hook 'company-mode)
(add-hook 'c-mode-hook 'company-complete)
(add-hook 'c-mode-hook 'company-c-headers)
(add-hook 'c-mode-common-hook 'flycheck-mode)

(setq company-mode 1)
(setq company-auto-complete 1)
;;(company-c-headers)
(highlight-numbers-mode 1)

;;Setting Tab to indent region if anything is selected
(defun tab-indents-region () (local-set-key [(tab)] 'fledermaus-maybe-tab))
(add-hook 'c-mode-common-hook   'tab-indents-region)
;;fledermaus came up with this
(defun fledermaus-maybe-tab ()
  (interactive)
  (if (and transient-mark-mode mark-active)
      (indent-region (region-beginning) (region-end) nil)
    (c-indent-command)))
