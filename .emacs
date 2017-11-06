
(setenv "HOME" "/home/guoyao/")
;; (setenv "PATH" "/home/guoyao/:/user")
(setq default-directory "~/")

(add-to-list 'load-path "~/.emacs.d/bin")
(add-to-list 'load-path "~/.emacs.d/lib")


(load "base.el")			;; yes
(load "go.el")
(load "c.el")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(load "~/.emacs.d/lib/color-theme.el")
(color-theme-initialize)
(color-theme-arjen)

(add-to-list 'load-path "~/.emacs.d/lib/go-mode")
(require 'go-mode)

;---------------------
;;--helm + gtags--------------------------------

(add-to-list 'load-path "~/.emacs.d/elpa/helm-20171104.2211/")
(require 'helm-config)
;;(require 'helm-gtags)
;;---------------------------end helm + gtags----------------------------------------

;;---------------------------auto-complete--------------------------
(add-to-list 'load-path "~/.emacs.d/lib/auto-complete")
(require 'go-autocomplete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs_dir/lib/auto-complete/ac-dict")
(ac-config-default)

;;-------------------------end auto-complete------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-listing-switches "")
 '(helm-always-two-windows t)
 '(helm-boring-buffer-regexp-list (quote ("\\*" "\\
" "Dired")))
 '(helm-buffer-details-flag t)
 '(list-directory-brief-switches "")
 '(list-directory-verbose-switches "")
 '(ls-lisp-verbosity nil)
 '(mouse-1-click-in-non-selected-windows t)
 '(safe-local-variable-values (quote ((eval setenv "GTAGSLIBPATH" (concat (getenv "HOME") "/sandai/dcdn_server/src/xunlei.com/shuijing")) (eval let ((gopath (getenv "GOPATH"))) (if (not (string-match-p project-dir gopath)) (progn (setenv "GOPATH" (concat (getenv "GOPATH") ":" (concat (getenv "HOME") "sandai/dcdn_server") ":" project-dir)) (setenv "PATH" (concat (getenv "PATH") ":" (concat project-dir "bin")))))) (eval set (make-local-variable (quote project-dir)) (file-name-directory (let ((d (dir-locals-find-file "."))) (if (stringp d) d (car d))))))))
 '(save-place t nil (saveplace))
 '(speedbar-default-position (quote right))
 '(truncate-partial-width-windows 1000))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

