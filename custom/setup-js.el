(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :init
  (add-hook 'js2-mode #'js2-imenu-extras-mode)
  (add-hook 'js2-mode-hook (lambda ()
                             (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
  (define-key js-mode-map (kbd "M-.") nil))

(use-package js2-refactor
  :init
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-r")
  :bind
  (("C-c C-r k" . js2r-kill)))

;; (use-package tern
;;   :init
;;   (add-hook 'js2mode-hook (lambda()
;;                             (tern-mode)
;;                             (company-mode)))
;;   (add-to-list 'company-backends 'company-tern))

(use-package tide
  :ensure t
  :after (js2-mode company flycheck)
  :hook ((js2-mode . tide-setup)
         (js2-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save))
  :init
  (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(use-package xref-js2)

;; (use-package npm
;;   :ensure t)

(provide 'setup-js)
;;; setup-js.el ends here
