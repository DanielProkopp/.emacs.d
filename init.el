;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ("melpa" . "http://melpa-stable.milkbox.net/packages/")))


;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; Define he following variables to remove the compile-log warnings
;; when defining ido-ubiquitous
(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-cur-list nil)
(defvar predicate nil)
(defvar inherit-input-method nil)

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages '(paredit
		      clojure-mode
		      ;; extra syntax highlighting for clojure
		      clojure-mode-extra-font-locking
		      cider
		      ido-ubiquitous
		      smex
		      projectile
		      rainbow-delimiters))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.slime")

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'load-path "~/.emacs.d/customizations/langs")
;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.elc")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.elc")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.elc")

;; These customizations make editing a bit nicer.
(load "editing.elc")

;; Hard-to-categorize customizations
(load "misc.elc")

;; For editing lisps
(load "elisp-editing.elc")

;; Langauage-specific
(load "setup-clojure.elc")
(load "setup-js.elc")
(load "setup-lisp-mode.elc")

(load "setup-c-mode.elc")


;;(require 'sly)
;;(add-hook 'sly-mode-hook  'rainbow-delimiters-mode)
;;(push 'sly-repl-ansi-color sly-contribs)
;;(add-hook 'sly-mode-hook 'sly-macrostep)
;;(add-hook 'sly-mode-hook 'sly-repl-ansi-color)
;;(add-hook 'sly-mode-hook 'sly-quicklisp)

;; (eval-after-load 'sly-mrepl
;;   `(define-key sly-mrepl-mode-map (kbd "C-c C-k")
;;      'sly-mrepl-clear-repl))


(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(global-set-key (kbd "C-\'") 'neotree-toggle)
(global-set-key (kbd "C-\"") 'neotree-dir)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(package-selected-packages
   (quote
    (ac-slime slime-repl undo-tree company-c-headers neotree slime-company highlight-quoted flx flx-ido flycheck-clojure tagedit smex rainbow-delimiters projectile paredit magit ido-ubiquitous clojure-mode-extra-font-locking cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
