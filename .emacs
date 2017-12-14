

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setenv "HOME" "/data/home/guoyao/")
;; (setenv "PATH" "/home/guoyao/:/user")
(setq default-directory "~/")

(add-to-list 'load-path "~/.emacs.d/bin")
(add-to-list 'load-path "~/.emacs.d/lib")


(load "base.el")			;; yes
(load "go.el")
(load "c.el")

(require 'package)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;;(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
       '("melpa" . "http://melpa.milkbox.net/packages/")
          t)

(load "~/.emacs.d/lib/color-theme.el")
(color-theme-initialize)
(color-theme-arjen)


;;---------------------------auto-complete--------------------------
;;(add-to-list 'load-path "~/.emacs.d/lib/auto-complete")
;;(require 'go-autocomplete)
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs_dir/lib/auto-complete/ac-dict")
;;(ac-config-default)

;;-------------------------end auto-complete------------------------------

