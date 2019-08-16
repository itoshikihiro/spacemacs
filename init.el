;; load all modules by path
(add-to-list 'load-path "~/.emacs.d/lisp/")


;; load modules
;; load init-packages module
(require 'init-packages)
;; load init-ui module
(require 'init-ui)

(setq ring-bell-function 'ignore)

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



(setq enable-recursive-minibuffers t)

;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; ---------------------------------
;; Normal settings
;; ---------------------------------


;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; bind <f2> with open-init-file function
(global-set-key (kbd "<f2>") 'open-init-file)
;; change font size
(set-face-attribute 'default nil :height 160)


;; turn off backup
(setq make-backup-files nil)
;; delete by selection
(delete-selection-mode t)




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

;; turn on avvrev-mode
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("8jl" "Jie Lin")
					    ;; internet signature
					    ("8ih" "itoshikihiro")
					    ))


