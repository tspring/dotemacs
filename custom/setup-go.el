(use-package go-mode
  :ensure t
  :init
  ())

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (go-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; ;; if you are ivy user
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode
  :bind
  (("C-c d b a" . dap-breakpoint-add)
   ("C-c d b d" . dap-breakpoint-delete)
   ("C-c d d" . dap-debug)
   ("C-c d q" . dap-delete-session)
   ("C-c d i" . dap-step-in)
   ("C-c d o" . dap-step-out)
   ("C-c d n" . dap-next)))

(require 'dap-go)
(dap-go-setup)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(provide 'setup-go)