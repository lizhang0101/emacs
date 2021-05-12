(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Package Management
(require 'init-packages)
(require 'init-better-defaults)
(require 'init-ui)
(require 'init-org)
(require 'init-keybindings)

;;(load "~/.emacs.d/lisp/crc-mode.el")

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  ;;(find-file "~/AppData/Roaming/.emacs.d/init.el"))
  (find-file "~/.emacs.d/init.el"))

;; Set HOME dir for Windows
(defun set-home-dir (dir)
  "Set a new HOME directory. This is where Emacs will look for init files and
   where '~' will default to."
  (setenv "HOME" dir)
  (message (format "HOME location is %s" (getenv "HOME"))))

(if (file-exists-p "c:/Users/leo.zhang")
  (set-home-dir "c:/Users/leo.zhang"))

(if (file-exists-p "c:/Users/lizha")
  (set-home-dir "c:/Users/lizha"))

(if (file-exists-p "~/emacs")
    (add-to-list 'load-path "~/emacs/"))

(if (file-exists-p "~/emacs")
    (autoload 'crc-mode "crc-mode" "Major mode for editing CRC code" t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("78e9a3e1c519656654044aeb25acb8bec02579508c145b6db158d2cfad87c44e" "9abe2b502db3ed511fea7ab84b62096ba15a3a71cdb106fd989afa179ff8ab8d" default)))
 '(package-selected-packages
   (quote
    (zzz-to-char company evil evil-leader hungry-delete swiper counsel smartparens projectile use-package exec-path-from-shell powerline-evil helm-ag cnfonts org-bullets))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-tab ((t (:foreground "#636363")))))
