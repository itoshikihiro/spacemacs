;; load all modules by path
(add-to-list 'load-path "~/.emacs.d/lisp/")


;; function to open init.el file
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; load modules
;; load init-packages module
(require 'init-packages)
;; load init-ui module
(require 'init-ui)
;; load init-better-default module
(require 'init-better-defaults)
;; load init-org module
(require 'init-org)
;; load init-keybindings
(require 'init-keybindings)


;; load lisp custome el 
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
