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

;; show matched parenthesis
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; improvment of highlight parenthesis
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))


;; delete by selection
(delete-selection-mode t)

(setq enable-recursive-minibuffers t)

;; format whole buffer
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))
;; format whether the whole buffer or the selected region
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

;; hippie function
(setq hippie-expand-try-function-list '(
					try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

;; Dried mode improvment
;; recursively delete in Dried mode
(setq dired-recursive-deletes 'always)
;; recursively copy in Dried mode
(setq dired-recursive-copies 'always)
(put 'dired-find-alternate-file 'disabled nil)
;; use C-x C-j to open current dir with Dried mode
(require 'dired-x)
;; if there are two Dried mode window, two windows can copy files directly
(setq dired-dwin-target 1)

;; change yes or no to y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; disable viewing ^M in html files
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

;; remove all ^M in html files
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; improvment of occur mode
;; dwin = do what I mean
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

;; set the system to utf-8
(set-language-environment "UTF-8")

;; last touch of whole module
(provide 'init-better-defaults)
