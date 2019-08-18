;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; use C-x C-r to view recent files
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; set C-h C-f for find function
(global-set-key (kbd "C-h C-f") 'find-function)
;; set C-h C-v for find variables
(global-set-key (kbd "C-h C-v") 'find-variable)
;; set C-h C-k for find function on key
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; bind <f2> with open-init-file function
(global-set-key (kbd "<f2>") 'open-init-file)

;; bind counsel-git to find all commited files in git
(global-set-key (kbd "C-c p f") 'counsel-git)

;; bind C-a to org agenda
(global-set-key (kbd "C-c a") 'org-agenda)

;; indent keybinding
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; hippie keybind
;; command + /
(global-set-key (kbd "s-/") 'hippie-expand)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; bind template generator for org mode
(global-set-key (kbd "C-c r") 'org-capture)

;; occur mode
(global-set-key (kbd "M-s o") 'occur-dwim)

;; indenting switch for web mode
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; multiple entries editing mode
;; jumping among functions
(global-set-key (kbd "M-s i") 'counsel-imenu)

;; expand region keybindings
(global-set-key (kbd "C-=") 'er/expand-region)

;; iedit config
;; multiple entries editing mode 
(global-set-key (kbd "M-s e") 'iedit-mode)

;; remap selecting shortcuts for company mode
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; search regex in the project
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;; last touch of whole module
(provide 'init-keybindings)
