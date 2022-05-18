(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))

(use-package company
  :config
  (push 'company-robe company-backends))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (ruby-mode .lsp)
  (lsp-mode . lsp-enable-which-key-integration)
  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)

(use-package dap-mode
  :bind
  (("C-c d b a" . dap-breakpoint-add)
   ("C-c d b d" . dap-breakpoint-delete)
   ("C-c d d" . dap-debug)
   ("C-c d q" . dap-delete-session)
   ("C-c d i" . dap-step-in)
   ("C-c d o" . dap-step-out)
   ("C-c d n" . dap-next)))

(use-package web-mode
  :ensure t
  :mode "\\.erb\\'")

(use-package rvm
  :ensure t
  :config
  (rvm-use-default))

(use-package inf-ruby
  :ensure t
  :init
  ;; (add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode))
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
  (add-hook 'ruby-mode-hook 'robe-mode))

(use-package robe
  :ensure t
  :bind ("C-M-." . robe-jump)
  ;; :init
  ;;  (add-hook 'ruby-mode-hook 'robe-mode)

  :config
  (defadvice inf-ruby-console-auto
      (before activate-rvm-for-robe activate)
    (rvm-activate-corresponding-ruby))
  (robe-start t))

(use-package rinari
  :init
  (global-rinari-mode))


(use-package yari
  :init (defalias 'ri 'yari))

(use-package bundler)

(use-package projectile-rails
  :ensure t
  :init
  (projectile-rails-global-mode)
  :bind
  (("C-c p r c" . projectile-rails-console)
   ("C-c p r f c" . projectile-rails-find-controller)
   ("C-c p r f v" . projectile-rails-find-view)
   ("C-c p r f m" . projectile-rails-find-migration)
   ("C-c p r f j" . projectile-rails-find-javascript)
   ("C-c p r f t" . projectile-rails-find-test)
   ("C-c p r g r" . projectile-rails-goto-routes)
   ("C-c p r g s" . projectile-rails-goto-schema)
   ("C-c p r g g" . projectile-rails-goto-gemfile)))

(define-key projectile-rails-mode-map (kbd "C-c p r c") 'projectile-rails-console)

(provide 'setup-ruby)
