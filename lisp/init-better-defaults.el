;; Fix the issue that Emacs very slow in Windows
(setq inhibit-compacting-font-caches t)

(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

;; Display line number
(global-linum-mode t)

;; Turn off backup and auto-save
(setq make-backup-files nil)
(setq auto-save-default nil)

(recentf-mode 1)
(setq recent-max-menu-item 25)

; 开启全局 Company 补全
(global-company-mode 1)

;; 当你选中一段文字 之后输入一个字符会替换掉你选中部分的文字
(delete-selection-mode 1)

;; 启用自动括号匹配（Highlight Matching Parenthesis）
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-better-defaults)
