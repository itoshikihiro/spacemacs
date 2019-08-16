;; org mode highights code
(require 'org)
(setq org-src-fontify-natively t)

;; org mode agenda function
(setq org-agenda-files '("/Users/itoshiki/Documents/002_agenda"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; last touch of the whole module
(provide 'init-org)
