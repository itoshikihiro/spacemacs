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

;; last touch of whole module
(provide 'init-keybindings)
