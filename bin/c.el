(defun get-string-from-file (filePath)
    "Return a list of lines of a file at filePath."
    (with-temp-buffer
      (insert-file-contents filePath)
      (buffer-string)))

(defun run-lint-warn-serial()
  (interactive)
  (shell-command (format "d:/emacs/lint/lint-nt.exe -fff -id:/emacs/lint/ -i%S -u %Sinclude.lnt -u d:/emacs/lint/std.lnt -u d:/emacs/lint/options.lnt  -u d:/emacs/lint/include.lnt -w2 %S " (helm-gtags--find-tag-directory) (helm-gtags--find-tag-directory) (buffer-name))) 
  )


(global-set-key (kbd "M-7") 'run-lint-warn-serial)

(defun run-lint-warn-all-serial()
  (interactive)
  (shell-command (format "d:/emacs/lint/lint-nt.exe -fff -id:/emacs/lint/ -i%S -u %Sinclude.lnt -u d:/emacs/lint/std.lnt -u d:/emacs/lint/options.lnt  -u d:/emacs/lint/include.lnt -w2  %s" (helm-gtags--find-tag-directory) (helm-gtags--find-tag-directory) (replace-in-string (get-string-from-file (format "%sfile.lnt"  (helm-gtags--find-tag-directory))) (string ?\C-j) " " )))
  )
(global-set-key (kbd "M-8") 'run-lint-warn-all-serial)

(defun run-lint-warn()
  (interactive)
  (shell-command (format "d:/emacs/lint/lint-nt.exe -fff -id:/emacs/lint/ -i%S -u %Sinclude.lnt -u d:/emacs/lint/std.lnt -u d:/emacs/lint/options.lnt -u d:/emacs/lint/options-extra.lnt -u d:/emacs/lint/include.lnt -w2 %S " (helm-gtags--find-tag-directory) (helm-gtags--find-tag-directory) (buffer-name))) 
  )

(defun run-lint-warn-hook ()
  (local-set-key (kbd "C-7") 'run-lint-warn))

(add-hook 'c-mode-hook 'run-lint-warn-hook)
(add-hook 'c++-mode-hook 'run-lint-warn-hook)

(defun run-lint-all()
  (interactive)
  (shell-command (format "d:/emacs/lint/lint-nt.exe -fff -id:/emacs/lint/ -i%S -u %Sinclude.lnt -u d:/emacs/lint/std.lnt -u d:/emacs/lint/options.lnt -u d:/emacs/lint/options-extra.lnt -u d:/emacs/lint/include.lnt -w2  %s" (helm-gtags--find-tag-directory) (helm-gtags--find-tag-directory) (replace-in-string (get-string-from-file (format "%sfile.lnt"  (helm-gtags--find-tag-directory))) (string ?\C-j) " " )))
  )

(defun run-lint-all-hook ()
  (local-set-key (kbd "C-8") 'run-lint-all))
(add-hook 'c-mode-hook 'run-lint-all-hook)

;;-----------------table -> space------------------------
(defun untabify-file()
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (untabify (point-min) (point-max) t)
    )
  (save-buffer)
  )
(global-set-key [f11] 'untabify-file)

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
(global-set-key (kbd "C-y") 'yank-and-indent)




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
(global-set-key (kbd "C-RET") 'my-new-line-and-indent)


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
(global-set-key (kbd "C-k") 'delete-intelligent)

;;------------------------------------------------------------

(defun delete-word() "delete word, take it out of kill ring. bind this func to M-d"
 (interactive)
 (setq last-command 'delete-word)
 (kill-word 1) 
 (setq kill-ring (cdr kill-ring))
 (setq kill-ring-yank-pointer kill-ring)
 (setq last-command 'delete-word-backward)
)
(global-set-key (kbd "M-d") 'delete-word)

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
(global-set-key (kbd "M-<backspace>") 'delete-word-backward)


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
(global-set-key (kbd "{") 'big)

(defun middle(arg)
  (interactive "p")
  (self-insert-command arg)
  (c-indent-line-or-region)
  (insert-char ?\])
  (backward-char)
  )
(global-set-key (kbd "[") 'middle)

(defun small(arg)
  (interactive "p")
  (self-insert-command arg)
  (c-indent-line-or-region)
  (insert-char ?\))
  (backward-char)
  )
(global-set-key (kbd "(") 'small)


(defun double-qoute(arg)
  (interactive "p")
  (self-insert-command arg)
  (c-indent-line-or-region)
  (insert-char ?\")
  (backward-char)
  )
(global-set-key (kbd "\"") 'double-qoute)

(defun qoute(arg)
  (interactive "p")
  (self-insert-command arg)
  (c-indent-line-or-region)
  (insert-char ?\')
  (backward-char)
  )
(global-set-key (kbd "\'") 'qoute)


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
(global-set-key (kbd "C-<del>") 'delete-blanks-backward)


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


(defun gy-find-tag-arg (n)  
  (interactive "sPattern: ")
  (helm-gtags-find-pattern n)
  )
  
;; (global-set-key (kbd "M-r") 'gy-find-tag-arg)

;; (global-set-key (kbd "C-j") 'helm-buffers-list)



