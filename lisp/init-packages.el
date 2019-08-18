;; cl - Common Lisp Extension
(require 'cl)


(when (>= emacs-major-version 24)
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
				;; javascript coding improvement
				js2-refactor
				;; excute javascript
				nodejs-repl
				;; easy search emcas help
				popwin
				;; to open view in finder program
				reveal-in-osx-finder
				;; html coding improvement
				web-mode
				;; quickly select regions
				expand-region
				;; quickly edit multiple lines
				iedit
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

;; smartparens settings
(require 'smartparens-config)
(smartparens-global-mode t)

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;config what files open with what major mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

;; popwin config
(require 'popwin)
(popwin-mode 1)

;; turn on globally company mode
(global-company-mode 1)

;; web-mode improvement settings
;; change all indent offset to 2
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)
;; change indent offset between 2 and 4
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))



;; config for js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")


;; improvement of imenu
(defun js2-imenu-make-index ()
  (interactive)
  (save-excursion
    ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
    (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
			       ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
			       ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
	  (lambda ()
	    (setq imenu-create-index-function 'js2-imenu-make-index)))



;; last touch for the whole file
(provide 'init-packages)
