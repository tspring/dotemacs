(use-package enh-ruby-mode
  :ensure t
  :mode "\\.rb\\'"
  :mode "Rakefile\\'"
  :mode "Gemfile\\'"
  :interpreter "ruby"

  :init
  (setq ruby-indent-level 2
        ruby-indent-tabs-mode nil)
  (add-hook 'enh-ruby-mode 'superword-mode)

  :bind
  (([(meta down)] . ruby-forward-sexp)
   ([(meta up)]   . ruby-backward-sexp)
   (("C-c C-e"    . ruby-send-region))))

(use-package company
  :no-require t
  :config
  (push 'company-robe company-backends))

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
  (add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode))

(use-package robe
  :ensure t
  :bind ("C-M-." . robe-jump)

  :init
  (add-hook 'enh-ruby-mode-hook 'robe-mode)

  :config
  (defadvice inf-ruby-console-auto
      (before activate-rvm-for-robe activate)
    (rvm-activate-corresponding-ruby)))

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

;; (define-key projectile-rails-mode-map (kbd "C-c p r c") 'projectile-rails-console)

(provide 'setup-ruby)
