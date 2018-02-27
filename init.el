
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq inhibit-default-init t)

(add-to-list 'load-path "~/.emacs.d/site-lisp")

(global-set-key (kbd "M-<up>") 'move-region-up)
(global-set-key (kbd "M-<down>") 'move-region-down)

(defun move-region (start end n)
  "Move the current region up or down by N lines."
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))

(defun move-region-up (start end n)
  "Move the current line up by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) -1 (- n))))

(defun move-region-down (start end n)
  "Move the current line down by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) 1 n)))

(global-set-key (kbd "C-c b") 'open-in-browser)

(defun open-in-browser()
  (interactive)
  (let ((filename (buffer-file-name)))
    (browse-url (concat "file://" filename))))

(set-face-attribute 'default nil :height 140)
(c-set-offset 'case-label '+)
(setq default-tab-width 2)

(when (not (member "-nf" command-line-args))
  (set-frame-parameter nil 'fullscreen 'fullboth))

(global-linum-mode t)
(global-auto-revert-mode t)
(global-set-key [f8] 'neotree-toggle)
(electric-pair-mode 1)
(projectile-mode 1)

(setq-default inhibit-startup-screen t)
(setq-default c-basic-offset 2)
(setq-default js-indent-level 2)
(setq-default show-trailing-whitespace t)
(setq-default indent-tabs-mode nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (go-mode projectile neotree multiple-cursors helm exec-path-from-shell 0blayout))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

(require 'column-marker)
(add-hook 'go-mode-hook (lambda () (interactive) (column-marker-1 80)))
