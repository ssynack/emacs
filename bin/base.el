;;=======================================================================
;;Author:guoyao
;;Date:2014-12-27
;;Update Date:2014-12-27
;=======================================================================

;;===============================display===============
;;----------------time---------------------
(display-time-mode 1);;ÆôÓÃÊ±¼äÏÔÊ¾ÉèÖÃ£¬ÔÚminibufferÉÏÃæµÄÄÇ¸ö¸ÜÉÏ
(setq display-time-24hr-format t);;Ê±¼äÊ¹ÓÃ24Ð¡Ê±ÖÆ
(setq display-time-day-and-date t);;Ê±¼äÏÔÊ¾°üÀ¨ÈÕÆÚºÍ¾ßÌåÊ±¼ä
(setq display-time-interval 10);;Ê±¼äµÄ±ä»¯ÆµÂÊ£¬µ¥Î»¶àÉÙÀ´×Å£¿
;;ÏÔÊ¾ÁÐºÅ
(setq column-number-mode t)


;;Ã»ÁÐ×ó±ßÏÔÊ¾ÐÐºÅ,°´f3ÏÔÊ¾/Òþ²ØÐÐºÅ
(require 'linum)
(global-linum-mode)

;;ÏÔÊ¾±êÌâÀ¸ %f »º³åÇøÍêÕûÂ·¾¶ %p Ò³Ãæ°Ù·ÖÊý %l ÐÐºÅ
(setq frame-title-format "%f")

;;·ÀÖ¹Ò³Ãæ¹ö¶¯Ê±Ìø¶¯£¬ scroll-margin 3 ¿ÉÒÔÔÚ¿¿½üÆÁÄ»±ßÑØ3ÐÐÊ±¾Í¿ªÊ¼¹ö¶¯£¬¿ÉÒÔºÜºÃµÄ¿´µ½ÉÏÏÂÎÄ
(setq scroll-margin 3  scroll-conservatively 10000)

;; È¥µô¹ö¶¯Ìõ
;;(set-scroll-bar-mode nil)
;;¹Ø±Õ¿ªÆô»­Ãæ
(setq inhibit-startup-message t)
;;½ûÓÃ¹¤¾ßÀ¸
;;(tool-bar-mode -1)
;;½ûÓÃ²Ëµ¥À¸
(menu-bar-mode -1)


;;Éè¶¨ÐÐ¾à
(setq default-line-spaceing 4)
;;Ò³¿í
(setq default-fill-column 1000)


(normal-erase-is-backspace-mode)
;;------------------style--------------


;;Ëø¶¨ÐÐ¸ß
(setq resize-mini-windows nil)
;;Ö»äÖÈ¾µ±Ç°ÆÁÄ»Óï·¨¸ßÁÁ£¬¼Ó¿ìÏÔÊ¾ËÙ¶È
(setq lazy-lock-defer-on-scrolling t)


;;¹â±êÐÎ×´
(setq-default cursor-type 'bar)
;;----¹â±ê¿¿½üÊ±Êó±êÅ²¿ª-----------------
;; (mouse-avoidance-mode 'animate)


;; µ±¹â±êÔÚÐÐÎ²ÉÏÏÂÒÆ¶¯µÄÊ±ºò£¬Ê¼ÖÕ±£³ÖÔÚÐÐÎ²¡£
(setq track-eol t)

;;ÉÁÆÁ±¨¾¯
(setq visible-bell t)
;;Ê¹ÓÃy or nÌáÎÊ
(fset 'yes-or-no-p 'y-or-n-p)

;;=================text==============
;;¿ªÆôÓï·¨¸ßÁÁ¡£
(global-font-lock-mode 1)
;;¸ßÁÁÏÔÊ¾ÇøÓòÑ¡Ôñ
(transient-mark-mode t)

;;¸ßÁÁÏÔÊ¾³É¶ÔÀ¨ºÅ
(show-paren-mode t)
;; (electric-pair-mode)


;; ×Ô¶¯µÄÔÚÎÄ¼þÄ©Ôö¼ÓÒ»ÐÂÐÐ
(setq require-final-newline t)

;;Õ³ÌùÓÚ¹â±ê´¦,¶ø²»ÊÇÊó±êÖ¸Õë´¦
(setq mouse-yank-at-point t)

;;µ±ÄãÔÚshell¡¢telnet¡¢w3mµÈÄ£Ê½ÏÂÊ±£¬±ØÈ»Åöµ½¹ýÒªÊäÈëÃÜÂëµÄÇé¿ö,´ËÊ±¼ÓÃÜÏÔ³öÄãµÄÃÜÂë
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)


;;==========================================

;;ÉèÖÃÈ±Ê¡Ö÷Ä£Ê½ÊÇtext£¬,²¢½øÈëauto-fill´ÎÄ£Ê½.¶ø²»ÊÇ»ù±¾Ä£Ê½fundamental-mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill) 

(setq x-select-enable-clipboard t)
;;²»²úÉú±¸·ÝÎÄ¼þ
(setq make-backup-files nil)
;;²»Éú³ÉÁÙÊ±ÎÄ¼þ
(setq-default make-backup-files nil)


;;ÉèÖÃÉ¾³ý¼ÇÂ¼
(setq kill-ring-max 200)

;;×Ô¶¯ÖØÔØ¸ü¸ÄµÄÎÄ¼þ
(global-auto-revert-mode 1)
;;customeµÄ·ç¸ñ¸ÄÎªµ¥Ò»µÄÊ÷×´·ç¸ñ
(setq custom-buffer-style 'brackets)

(setq show-paren-style 'parentheses)

;;µÝ¹éminibuffer
(setq enable-recursive-minibuffers t)

;;ÉèÖÃ×Ô¶¨Òå±äÁ¿
(custom-set-variables
 '(mouse-1-click-in-non-selected-windows t)
 '(save-place t nil (saveplace)))

;;================tool======================
;;-------------ibuffer,²é¿´bufer
(require 'ibuffer)
(global-set-key ( kbd "C-x C-b")' ibuffer)
;;------------------ido-----------------------
;;idoµÄÅäÖÃ,Õâ¸ö¿ÉÒÔÊ¹ÄãÔÚÓÃC-x C-f´ò¿ªÎÄ¼þµÄÊ±ºòÔÚºóÃæÓÐÌáÊ¾;
;;ÕâÀïÊÇÖ±½Ó´ò¿ªÁËidoµÄÖ§³Ö£¬ÔÚemacs23ÖÐÕâ¸öÊÇ×Ô´øµÄ.
(ido-mode t)

;;ÈÃ dired ¿ÉÒÔµÝ¹éµÄ¿½±´ºÍÉ¾³ýÄ¿Â¼¡£
;; (setq dired-recursive-copies 'top)
;; (setq dired-recursive-deletes 'top)

(require 'ls-lisp)
(setq ls-lisp-use-insert-directory-program nil)



;;===========================================================
;;键绑定
;;===========================================================

(global-set-key (kbd "C-z") 'kill-this-buffer)


;;目的是开一个shell的小buffer，用于更方便地测试程序(也就是运行程序了)，我经常会用到。
;;f8就是另开一个buffer然后打开shell，C-f8则是在当前的buffer打开shell,shift+f8清空eshell
(defun open-eshell-other-buffer ()
  "Open eshell in other buffer"
  (interactive)
  (split-window-horizontally)
  (eshell)
  )
(global-set-key [(f8)] 'eshell)

;;设置F10为撤销
(global-set-key (kbd "C-/") 'undo)

;;设置M-g为goto-line
(global-set-key (kbd "M-g") 'goto-line)

;;取消control+space键设为mark
(global-set-key (kbd "C-SPC") 'nil)
;; (global-set-key (kbd "C-RET") 'nil)

;;关闭当前窗口,alt+4
(global-set-key (kbd "M-2") 'delete-window)
;;关闭其他窗口,alt+1
(global-set-key (kbd "M-1") 'delete-other-windows)
;;垂直分割窗口,alt+3

(defun split-window-horizontally-1()
  (interactive)
  (split-window-horizontally)
  (next-multiframe-window)
)
(global-set-key (kbd "M-`") 'split-window-horizontally-1)
;;切换到其他窗口，alt+0
;;================================================================

(global-set-key (kbd "C-2") 'set-mark-command)

;;----------------------------------------------------------------------------

(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command. If no region is selected and current line is not blank and we are not at the end of the line, then comment current line. Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P" )
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)


(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'shell-mode-hook 'hs-minor-mode)
(add-hook 'go-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'krstyle)
(add-hook 'c++-mode-hook 'krstyle)
(add-hook 'lisp-mode-hook 'krstyle)
(add-hook 'shell-mode-hook 'krstyle)

(defun krstyle()
  (interactive)
  (c-set-style "gy")
  )

;; ÒÔc++Ä£Ê½´ò¿ªÍ·ÎÄ¼þ
(setq auto-mode-alist (cons '("\\.h$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ice$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.proto$" . c++-mode) auto-mode-alist))  
(setq auto-mode-alist (cons '("\\.sql$" . sql-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.xml$" . xml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.go$" . go-mode) auto-mode-alist))
;;ÒÔc++Ä£Ê½´ò¿ª¿ÉÒÔÓÐÐ§ÀûÓÃc++µÄÅäÖÃ×ÊÔ´

(setq auto-mode-alist (cons '("\\.org$" . org-mode) auto-mode-alist))  

(defun wy-go-to-char (n char)  
  "Move forward to Nth occurence of CHAR.  
Typing `wy-go-to-char-key' again will move forwad to the next Nth  
occurence of CHAR."  
  (interactive "p\ncGo to char: ")  
  (search-forward (string char) nil nil n)
  (backward-char)
  (while (char-equal (read-char)  
                                         char)  
        (progn (forward-char)
                   (search-forward (string char) nil nil n)
                   (backward-char)
                   )
        )
(setq unread-command-events (list last-input-event)))
(define-key global-map (kbd "C-v") 'wy-go-to-char)

(define-key global-map (kbd "M-p") 'scroll-down)
(define-key global-map (kbd "M-n") 'scroll-up)


(defun my-highlight-symbol()
  (interactive)
  (highlight-regexp (symbol-at-point))
  )


(defun my-unhighlight-symbol()
  (interactive)
  (unhighlight-regexp (symbol-at-point))
  )

(defun copy-line-1()
  (interactive)
  (setq cur-point (point))
  (kill-ring-save (line-beginning-position) (line-end-position))
  (goto-char cur-point)
  )

(defun copy-intelligent()
  (interactive)
  (setq cur-point (point))
  (if (equal mark-active nil)
      (copy-line-1)
    (kill-ring-save (mark) (point))
    )
  )

(defun cut-line-1()
  (interactive)
  (kill-region (line-beginning-position) (line-end-position))
  )

(defun cut-intelligent()
  (interactive)
  (if (equal mark-active nil)
          (cut-line-1)
        (kill-region (mark) (point))
        (setq kill-ring kill-ring)
        ))


(defun delete-word-backward() "delete word, take it out of kill ring. bind this func to M-d"
 (interactive)
 (setq last-command 'delete-word-backward)
 (backward-kill-word 1)
 (setq kill-ring (cdr kill-ring))
 (setq kill-ring-yank-pointer kill-ring)
 (setq last-command 'delete-word-backward)
)


(defun new-line()
(interactive)
(move-end-of-line 1)
(newline-and-indent)
)
(global-set-key (kbd "C-o") 'new-line)

(global-set-key (kbd "M-l") 'delete-word-backward)
(global-set-key (kbd "C-l") 'delete-backward-char)

(global-set-key (kbd "C-i") 'copy-intelligent)
(global-set-key (kbd "M-i") 'cut-intelligent)


(global-set-key (kbd "C-q") 'hs-hide-level)
(global-set-key (kbd "M-q") 'hs-show-block)

(global-set-key (kbd "C-j") 'buffer-menu-other-window)
(global-set-key (kbd "M-j") 'highlight-regexp)
(global-set-key (kbd "M-J") 'unhighlight-regexp)

(global-set-key (kbd "TAB") 'indent-for-tab-command)


