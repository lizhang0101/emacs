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

(if (file-exists-p "~/emacs")
    (add-to-list 'load-path "~/emacs/"))

(if (file-exists-p "~/emacs")
    (autoload 'crc-mode "crc-mode" "Major mode for editing CRC code" t))
