;; this file contains default settings

;; no sound
(setq ring-bell-function 'ignore)

;; show line number
(global-linum-mode t)

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

;; force emaces split window vertically
(setq split-width-threshold 0)
(setq split-height-threshold nil)

;; turn off backup
(setq make-backup-files nil)
;; turn off back list
(setq auto-save-default nil)

;; maximum number of recent files is 25
(recentf-mode 1)
(setq recentf-max-menu-item 25)

;; show matched parathesis
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; delete by selection
(delete-selection-mode t)

(setq enable-recursive-minibuffers t)


(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

;; last touch of whole module
(provide 'init-better-defaults)
