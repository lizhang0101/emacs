;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
;;(setq package-archives '(("melpa" . "https://melpa.org/packages")))
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/"),
	("org" . "https://orgmode.org/elpa/")
	("melpa" . "https://melpa.org/packages/")
	("melpa-stable" . "https://stable.melpa.org/packages/"))
      package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))

;; cl - Common Lisp Extension
(require 'cl)

;; Add packages
(defvar my/packages '(
		      ;; --- Auto completion ---
		      company
		      ;; --- Better Editor ---
		      evil
		      evil-leader
		      ;;evil-tabs
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      projectile
              use-package
		      ;; --- Major Mode ---
		      ;; js2-mode
		      ;; --- Minor Mode ---
		      ;; nodejs-repl
		      exec-path-from-shell
		      ;; --- Theme ---
		      ;; monokai-theme
		      powerline-evil
		      ;;zenburn 
		      ;; --- Search  ---
		      helm-ag
		      ;; --- font ---
		      cnfonts
		      ;; --- Org mode ---
		      org-bullets
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(require 'use-package)

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; ============================== Evil ============================== 
;; Make <Tab> key work in org mode in Evil
(setq evil-want-C-i-jump nil)
(require 'evil)
(global-evil-leader-mode)
(evil-mode 1)
(evil-leader/set-leader ",")
;;(global-evil-tabs-mode t)

;; ============================== Ivy ============================== 
(ivy-mode 1)
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)

;; ============================== projectile ============================== 
(projectile-mode 1)
(setq projectile-completion-system 'ivy)
;;(global-set-key (kbd "s-f") 'projectile-find-file)
(evil-leader/set-key "ff" 'projectile-find-file)
;;(global-set-key (kbd "s-F") 'projectile-grep)
;;(evil-leader/set-key "fg" 'projectile-grep)

(provide 'init-packages)

