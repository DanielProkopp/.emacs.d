
(setq c-default-style "k&r"
      c-basic-offset 4
      indent-tabs-mode t
      c-tab-always-indent t)

(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))


(electric-pair-mode 1)

(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'c-mode-hook 'set-newline-and-indent)
(add-hook 'c-mode-hook
	  (lambda ()	
	    (add-to-list 'c-mode-hook 'highlight-numbers-mode)
            (add-to-list 'c-mode-hook 'company-mode)
            (add-to-list 'c-mode-hook 'company-c-headers)
            (add-to-list 'c-mode-hook 'company-complete)
	    (add-to-list 'c-mode-hook 'flycheck-mode)))
;;Setting Tab to indent region if anything is selected
(defun tab-indents-region () (local-set-key [(tab)] 'fledermaus-maybe-tab))
(add-hook 'c-mode-common-hook   'tab-indents-region)
;;fledermaus came up with this
(defun fledermaus-maybe-tab ()
  (interactive)
  (if (and transient-mark-mode mark-active)
      (indent-region (region-beginning) (region-end) nil)
    (c-indent-command)))
