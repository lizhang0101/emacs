;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 高亮当前行 - 在-nw模式下有问题
;;(global-hl-line-mode 1)

;; Max window as default
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(display-time-mode t)

;; ============================== Color Scheme ============================== 
;;(custom-set-variables
;; '(package-selected-packages (quote (company zenburn-theme color-theme))))
;;(load-theme 'zenburn t)
;; (load-theme 'monokai t)
(use-package monokai-theme
  :ensure t)

;; ============================== FONT ============================== 
;; 配置cnfonts，原名chinese-font-setup
;; 让 cnfonts 随着 Emacs 自动生效。
;; (cnfonts-enable)
(use-package cnfonts
  :ensure t)

(add-to-list 'default-frame-alist
	     '(font . "Fira Mono For Powerline-13")
	     '(font . "WenQuanYi Zen Hei Mono-13")
	     )

;; (set-frame-font "WenQuanYi Zen Hei Mono-13" nil t)

;; ============================== Whitespace configuration ============================== 
;; https://dougie.io/emacs/indentation/

;; WARNING: This will change your life
;; (OPTIONAL) Visualize tabs as a pipe character - "|"
;; This will also show trailing characters as they are useful to spot.
(setq whitespace-style '(face tabs tab-mark trailing))
(custom-set-faces
 '(whitespace-tab ((t (:foreground "#636363")))))
(setq whitespace-display-mappings
  '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
(global-whitespace-mode) ; Enable whitespace mode everywhere

(provide 'init-ui)
