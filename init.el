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
    (set-home-dir "c:/Users/leo.zhang")
  `(set-home-dir "c:/Users/lizha"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
