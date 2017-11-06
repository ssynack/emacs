;;-----------------table -> space------------------------
(defun untabify-file()
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (untabify (point-min) (point-max) t)
    )
  (save-buffer)
  )

;;-----------------------dos2unix------------------------

(defun yank-and-indent ()
  (interactive)
  (if (not (equal mark-active nil))
      (delete-region (mark) (point))
    )
  (setq begin-line (line-number-at-pos))
  (yank)
  (setq end-line (line-number-at-pos))
  (if (> end-line begin-line)
      (progn (while (>= end-line begin-line)
              (progn (goto-line begin-line)    
                      (c-indent-line-or-region)
                      (setq begin-line (+ begin-line 1))
                      )
               )
             (end-of-line)
             )
    (c-indent-line-or-region)
    )
  )

(defun my-new-line-and-indent (arg)
  (interactive "^p")
  (or arg (setq arg 1))
  (let (done)
    (while (not done)
      (let ((newpos
         (save-excursion
           (let ((goal-column 0)
             (line-move-visual nil))
         (and (line-move arg t)
              (not (bobp))
              (progn
            (while (and (not (bobp)) (invisible-p (1- (point))))
              (goto-char (previous-single-char-property-change
                                      (point) 'invisible)))
            (backward-char 1)))
         (point)))))
    (goto-char newpos)
    (if (and (> (point) newpos)
         (eq (preceding-char) ?\n))
        (backward-char 1)
      (if (and (> (point) newpos) (not (eobp))
           (not (eq (following-char) ?\n)))
          ;; If we skipped something intangible and now we're not
          ;; really at eol, keep going.
          (setq arg 1)
        (setq done t))))))
 (newline-and-indent))

;; (global-set-key "C-<ret>" ')



;;----------------------------------------------------------------------------
;;-----------------------将emacs 的kill 换成delete------------------------
(defun delete-reg (beg end)
  (kill-region beg end)
  (setq kill-ring (cdr kill-ring))
  (setq kill-ring-yank-pointer kill-ring)
  )

(defun delete-line () "delete line, take it out of kill ring. bind this func to C-z"
           (interactive)
           (beginning-of-line)                          
           (kill-whole-line)
           
           (setq kill-ring (cdr kill-ring))
           (setq kill-ring-yank-pointer kill-ring)
           (setq last-command 'kill-whole-line)
           )

(defun delete-intelligent()
  (interactive)
  (if (equal mark-active nil)
          (delete-line)
        (delete-reg (mark) (point))

        )
  )


;;------------------------------------------------------------

(defun delete-word() "delete word, take it out of kill ring. bind this func to M-d"
 (interactive)
 (setq last-command 'delete-word)
 (kill-word 1) 
 (setq kill-ring (cdr kill-ring))
 (setq kill-ring-yank-pointer kill-ring)
 (setq last-command 'delete-word-backward)
)


;; (global-set-key (kbd "C-<backspace>") 'backward-delete-char)

(let ((str "-"))
  (string-match "[a-zA-Z0-9]" str)
  )  


(defun delete-word-backward() "delete word, take it out of kill ring. bind this func to M-d"
 (interactive)
 (setq last-command 'delete-word-backward)
 (backward-kill-word 1)
 (setq kill-ring (cdr kill-ring))
 (setq kill-ring-yank-pointer kill-ring)
 (setq last-command 'delete-word-backward)
)



(defun big(arg)
  (interactive "p")
  (self-insert-command arg)
  (c-indent-line-or-region)
  (newline 2)
  (insert-char ?})
  (c-indent-line-or-region)
  (previous-line)
  (c-indent-line-or-region)
  )


(defun middle(arg)
  (interactive "p")
  (self-insert-command arg)
  (c-indent-line-or-region)
  (insert-char ?\])
  (backward-char)
  )


(defun small(arg)
  (interactive "p")
  (self-insert-command arg)
  (c-indent-line-or-region)
  (insert-char ?\))
  (backward-char)
  )



(defun double-qoute(arg)
  (interactive "p")
  (self-insert-command arg)
  (c-indent-line-or-region)
  (insert-char ?\")
  (backward-char)
  )


(defun qoute(arg)
  (interactive "p")
  (self-insert-command arg)
  (c-indent-line-or-region)
  (insert-char ?\')
  (backward-char)
  )



(defun delete-blanks-backward()
  (interactive)
  (setq beg (point))
  (backward-char)
  (if
      (or
       (eq (char-after) ?\ )
       (eq (char-after) ?\n)
       )
      (progn
        (if (or
	     (eq (char-before) ?\ )
	     (eq (char-before) ?\n)
	     )
            (progn
              (backward-char)
              (while (or
		      (eq (char-before) ?\ )
		      (eq (char-before) ?\n)
		      )
                (backward-char)
                )
              (forward-char)
              )

          )
        )
    )
  (delete-reg (point) beg)
  )

(defun delete-blanks-forward()
  (interactive)
  (setq beg (point))
  (forward-char)
  (if
      (or
       (eq (char-before) ?\n)
       (eq (char-before) ?\ )
	    )
      (progn
        (if
	    (or
	     (eq (char-after) ?\n)
	     (eq (char-after) ?\ )
	     )
            (progn
              (forward-char)
              (while (or
		      (eq (char-after) ?\n)
		      (eq (char-after) ?\ )
		      )
                (forward-char)
                )
              (backward-char)
              )

          )
        )
    )
  (delete-reg (point) beg)
  )
(global-set-key (kbd "C-d") 'delete-blanks-forward)


(defun c-keymap-hook ()
  (local-set-key (kbd "\"") 'go-double-qoute)
  (local-set-key (kbd "\'") 'go-qoute)
  (local-set-key (kbd "(") 'go-small)
  (local-set-key (kbd "[") 'go-middle)
  (local-set-key (kbd "{") 'go-big)
  (local-set-key (kbd "C-y") 'yank-and-indent)
  (local-set-key (kbd "M-t") 'helm-gtags-find-tag-from-here)
  (local-set-key (kbd "M-r") 'go-find-referencs2)
  (local-set-key (kbd "C-<del>") 'delete-blanks-backward)
  (local-set-key (kbd "M-r") 'gy-find-tag-arg)
  (local-set-key (kbd "M-<backspace>") 'delete-word-backward)
  (local-set-key (kbd "{") 'big)
  (local-set-key (kbd "\'") 'qoute)
  (local-set-key (kbd "\"") 'double-qoute)
  (local-set-key (kbd "(") 'small)
  (local-set-key (kbd "[") 'middle)
  (local-set-key (kbd "C-k") 'delete-intelligent)
  (local-set-key [f11] 'untabify-file)
  (local-set-key (kbd "C-y") 'yank-and-indent)
  (local-set-key (kbd "C-RET") 'my-new-line-and-indent)
  (local-set-key (kbd "M-d") 'delete-word)
)
(add-hook 'c-mode-hook 'c-keymap-hook)
(add-hook 'c++-mode-hook 'c-keymap-hook)
