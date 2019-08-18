;; org mode highights code
(require 'org)
(setq org-src-fontify-natively t)

;; org mode agenda function
(setq org-agenda-files '("/Users/itoshiki/Documents/002_agenda"))


;; a template for org mode
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Documents/002_agenda/gtd.org" "工作安排")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)))


;; last touch of the whole module
(provide 'init-org)
