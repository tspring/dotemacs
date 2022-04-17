(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(use-package company-jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'my/python-mode-hook))

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(provide 'setup-python)
