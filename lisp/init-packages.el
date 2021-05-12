;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
;;(setq package-archives '(("melpa" . "https://melpa.org/packages")))
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
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
		      evil-nerd-commenter
		      which-key
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
		      monokai-theme
		      zenburn-theme
		      powerline-evil
		      ;;zenburn 
		      ;; --- Mode line  ---
		      moody
		      minions
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
(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (use-package evil-leader
    :ensure t
    :config
    (progn
      (global-evil-leader-mode)
      (setq evil-leader/in-all-states t)
      ;; Make <Tab> key work in org mode in Evil
      (setq evil-want-C-i-jump nil)
      ;; (setq evil-symbol-word-search t)
      (evil-leader/set-leader ","))))

(use-package evil-nerd-commenter
  :ensure t)

(with-eval-after-load 'evil
  (defalias #'forward-evil-word #'forward-evil-symbol))

;; ============================== Ivy/swiper/counsel ============================== 
(use-package counsel
  :ensure t)

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
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
    (global-set-key (kbd "C-c V") 'ivy-pop-view)))

;; ============================== projectile ============================== 
(use-package projectile
  :demand
  :init (setq projectile-use-git-grep t)
  :config
  (projectile-global-mode t)
  (setq projectile-completion-system 'ivy))

;; ============================== Mode line ============================== 
(use-package moody
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

(use-package minions
  :config (minions-mode 1))

;; ============================== Which key ============================== 
(use-package which-key
  :defer nil
  :config (which-key-mode))

(provide 'init-packages)

