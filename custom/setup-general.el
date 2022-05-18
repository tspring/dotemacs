;;; package  --- general config settings
;;; Commentary:
;;; Code:
(menu-bar-mode -1)
(tool-bar-mode -1)

(load-theme 'modus-operandi t)

(visual-line-mode t)
(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)
(blink-cursor-mode 0)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-=") (lambda () (interactive) (text-scale-set 0)))

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

(use-package company
  :init
  (global-company-mode 1)
  (delete 'company-semantic company-backends)
  :bind
  (("C-<return>" . 'company-complete)))

(use-package projectile
  :init
  (projectile-mode)
  (setq projectile-enable-caching t)
  :bind
  (("C-c p f f" . projectile-find-file)
   ("C-c p f g" . helm-projectile-ag)
   ("C-c p p" . helm-projectile-switch-project)))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(global-set-key (kbd "C-c C-w") 'whitespace-cleanup)
(windmove-default-keybindings)

(use-package which-key
  :ensure t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; Enable richer annotations using the Marginalia package
(use-package marginalia
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))

;;; setup-general ends here
(provide 'setup-general)
