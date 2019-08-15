;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  ;; package archives list
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t))
;; cl - Common Lisp Extension
(require 'cl)
(defvar itoshiki/packages '(
			    company
			    solarized-theme
			    monokai-theme
			    hungry-delete
			    swiper
			    counsel
			    smartparens
			    exec-path-from-shell
			    js2-mode
			    nodejs-repl
			    popwin
			    ) "Default packages")
;; prevent auto remove
(setq package-selected-packages itoshiki/packages)
(defun itoshiki/packages-installed-p ()
  (loop for pkg in itoshiki/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))
(unless (itoshiki/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg itoshiki/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; installed packages
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 3))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dark gray")))))


;; plugin settings

;; load solarized theme
;; (load-theme 'solarized-dark t)
(load-theme 'monokai t)

;; hungry delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; smartparens
(require 'smartparens-config)
;; smartparens globally
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

;; ---------------------------------
;; Normal settings
;; ---------------------------------

;; turn off tool-bar
(tool-bar-mode -1)
;; turn off scroll-bar
(scroll-bar-mode -1)
;; show linum-mode
(global-linum-mode 1)
;; turn off splash screen
(setq inhibit-splash-screen 1)
;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; bind <f2> with open-init-file function
(global-set-key (kbd "<f2>") 'open-init-file)
;; change font size
(set-face-attribute 'default nil :height 160)
;; turn on globally company mode
(global-company-mode 1)
;; change cursor type
(setq-default cursor-type 'bar)
;; turn off backup
(setq make-backup-files nil)
;; delete by selection
(delete-selection-mode t)
;; highlight line
(global-hl-line-mode t)

;; when open, full screen the emacs
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; use C-x C-r to view recent files
;; maximum number of recent files is 25
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; org文件中代码高亮
(require 'org)
(setq org-src-fontify-natively t)

;; set C-h C-f for find function
(global-set-key (kbd "C-h C-f") 'find-function)
;; set C-h C-v for find variables
(global-set-key (kbd "C-h C-v") 'find-variable)
;; set C-h C-k for find function on key
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; org mode agenda function
(setq org-agenda-files '("/Users/itoshiki/Documents/002_agenda"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; force emaces split window vertically
(setq split-width-threshold 0)
(setq split-height-threshold nil)

;; globally activate auto revert mode
(global-auto-revert-mode t)


