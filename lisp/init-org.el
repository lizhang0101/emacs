(setq org-src-fontify-natively t)

(set-language-environment "UTF-8")

;; Open default Org file
(global-set-key (kbd "C-c o")
		(lambda () (interactive) (find-file "~/Desktop/Work Org/work_log.org")))
(global-set-key "\C-ca" 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)

;; ============================== Org Mode - Capture ============================== 
(setq org-default-notes-file "~/OneDrive/org/main.org")
(global-set-key (kbd "C-c c") 'org-capture)
;;(add-to-list 'org-capture-templates
;;             '("t" "Testing" entry
;;               (file+datetree "~/OneDrive/org/testing.org")
;;	       "* %?\n输入于： %U\n  %i\n  %a"))
(setq org-capture-templates nil)
(setq org-capture-templates
      '(
	("t" "Testing" entry (file+datetree "~/OneDrive/org/testing.org")
	 "* %?\n输入于： %U\n  %i\n  %a")
	)
      )
;; 设置todo keywords
;; TODO: TODO
;; DONE: DONE
;; MOVE: Moved to later date and current item is considered as DONE.
(setq org-todo-keywords
      '((sequence "TODO" "|" "MOVE" "DONE")))

;; Enable org-indent mode
(setq org-startup-indented t)
(setq org-hide-emphasis-markers t)
;; Enable lines truncation in org mode
(add-hook 'org-mode-hook 'toggle-truncate-lines)

;;(setq org-agenda-files (list "~/OneDrive/org/work.org"
;;			     "~/OneDrive/org/personal.org"
;;			     "~/OneDrive/org/others.org"))

(setq org-agenda-files (list "~/Desktop/ANZJCT.org"))

;; Enable org-bullets
(add-to-list 'load-path "~/.emacs.d/org-bullets")
(require 'org-bullets)
;; 设置bullet list
;; ▲△▼▽●○◆◇■□★☆▶▷◀◁◑◐·
; (setq org-bullets-bullet-list '("♥" "▲" "◆" "★" "☆"))
;; (setq org-bullets-bullet-list '("1" "2" "3" "4" "5"))
(setq org-bullets-bullet-list '("★" "▶" "▷" "◇" "☆"))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(provide 'init-org)
