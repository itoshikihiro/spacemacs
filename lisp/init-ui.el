;; this module contains all ui settings

;; turn off tool-bar
(tool-bar-mode -1)
;; turn off scroll-bar
(scroll-bar-mode -1)
;; turn off splash screen
(setq inhibit-splash-screen 1)
;; when open, full screen the emacs
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;; highlight line
(global-hl-line-mode t)

;; change font size
(set-face-attribute 'default nil :height 160)


;; last touch of whole module settings
(provide 'init-ui)
