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

;; powline
(require 'powerline-evil)
(powerline-evil-vim-color-theme)
(display-time-mode t)

;; ============================== Color Scheme ============================== 
;;(custom-set-variables
;; '(package-selected-packages (quote (company zenburn-theme color-theme))))
;;(load-theme 'zenburn t)

;; ============================== FONT ============================== 
;; 配置cnfonts，原名chinese-font-setup
(require 'cnfonts)
;; 让 cnfonts 随着 Emacs 自动生效。
(cnfonts-enable)
;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
;; (cnfonts-set-spacemacs-fallback-fonts)

;;(custom-set-faces
 ;;'(default ((t (:family "Cascadia Mono" :foundry "outline" :slant normal :weight normal :height 130 :width normal)))))
 ;;'(default ((t (:family "Cascadia Mono" :weight normal :height 120 :width normal)))))

;;; Setting English Font
;;(set-face-attribute
;;  'default nil :font "WenQuanYi Zen Hei Mono" :size 14)
;;;; Setting Chinese Font
(defun s-font()
  (interactive)
  '(default ((t (:family "Cascadia Mono" :weight normal :height 120 :width normal))))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
		      charset
		      (font-spec :family "Microsoft Yahei" :size 14))))

(add-to-list 'after-make-frame-functions
	     (lambda (new-frame)
	       (select-frame new-frame)
	       (if window-system
		   (s-font))))

(if window-system
    (s-font))

(provide 'init-ui)
