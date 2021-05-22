;; 这个快捷键绑定可以用之后的插件 counsel 代替
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)
;; (global-set-key (kbd "C-c p s") 'helm-do-ag)

;; leader keybindings - sort order: a-z
(evil-leader/set-key
  "a" 'helm-do-ag-project-root
  "b" 'ivy-switch-buffer
  "cc" 'evilnc-comment-or-uncomment-lines
  "d" 'dired
  ;; open config file
  "e" 'open-init-file
  "ff" 'projectile-find-file
  "fg" 'projectile-grep
  "ww" 'save-buffer
  ;; {{ window move
  "wh" 'evil-window-left
  "wl" 'evil-window-right
  "wk" 'evil-window-up
  "wj" 'evil-window-down)

(provide 'init-keybindings)
