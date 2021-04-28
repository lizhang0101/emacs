;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
;;(setq package-archives '(("melpa" . "https://melpa.org/packages")))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; cl - Common Lisp Extension
(require 'cl)

;; Add packages
(defvar my/packages '(
		      ;; --- Auto completion ---
		      company
		      ;; --- Better Editor ---
		      evil
		      evil-leader
		      evil-tabs
		      hungry-delete
		      swiper
		      counsel
		      smartparens
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
(global-evil-tabs-mode t)

(provide 'init-packages)
