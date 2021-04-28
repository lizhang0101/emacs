;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
;;(global-set-key (kbd "<f2>") 'open-init-file)
(evil-leader/set-key "e" 'open-init-file)

;; 这个快捷键绑定可以用之后的插件 counsel 代替
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)
(evil-leader/set-key "a" 'helm-do-ag-project-root)
;; (global-set-key (kbd "C-c p s") 'helm-do-ag)

(provide 'init-keybindings)
