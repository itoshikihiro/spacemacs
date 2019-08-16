;; cl - Common Lisp Extension
(require 'cl)


(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  ;; package archives list
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t))


;; package list
(defvar itoshikihiro/packages '(
				;; auto complete
				company
				;; theme
				monokai-theme
				;; easy delete
				hungry-delete
				;; easy search
				swiper
				counsel
				;; auto complete parenthesis
				smartparens
				;; required for excuting comments in emcas
				exec-path-from-shell
				;; js2 major mode
				js2-mode
				;; excute javascript
				nodejs-repl
				;; easy search emcas help
				popwin
				) "Default packages")


;; prevent auto remove
(setq package-selected-packages itoshikihiro/packages)


;; packages auto installation part
(defun itoshikihiro/packages-installed-p ()
  (loop for pkg in itoshikihiro/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))
(unless (itoshikihiro/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg itoshikihiro/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;; plugin settings
;; theme load
(load-theme 'monokai t)

;; hungry delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; config js2-mode for all javascript
(setq auto-mode-alist
      (append
       '(("\\.js\\'". js2-mode))
       auto-mode-alist))

;; popwin config
(require 'popwin)
(popwin-mode 1)

;; turn on globally company mode
(global-company-mode 1)



;; last touch for the whole file
(provide 'init-packages)
