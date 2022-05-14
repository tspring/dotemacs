(require 'package)

;;; Code:

(load-theme 'modus-operandi t)
(visual-line-mode t)

(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(setq ring-bell-function 'ignore)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "~/.emacs.d/custom/el-easydraw")
(require 'edraw)

(add-to-list 'load-path "~/.emacs.d/custom/draw-cons-tree")
(require 'draw-cons-tree)

(use-package tex
  :defer t
  :ensure auctex)

(require 'setup-general)

;; (if (version< emacs-version "24.4")
;;     (require 'setup-ivy-counsel)
(require 'setup-helm)
(require 'setup-helm-gtags)

;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-ruby)
(require 'setup-python)
(require 'setup-go)

(which-key-mode)
(global-auto-revert-mode)
(setq auto-revert-avoid-polling t)
(display-line-numbers-mode t)

(use-package svg-lib
  :ensure t)

(setq backup-directory-alist `(("." . "~/.emacs_backups")))

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e27c391095dcee30face81de5c8354afb2fbe69143e1129109a16d17871fc055" "795d2a48b56beaa6a811bcf6aad9551878324f81f66cac964f699871491710fa" "efcecf09905ff85a7c80025551c657299a4d18c5fcfedd3b2f2b6287e4edd659" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "bd3b9675010d472170c5d540dded5c3d37d83b7c5414462737b60f44351fb3ed" "1ca05bdae217adeb636e9bc5e84c8f1d045be2c8004fafd5337d141d9b67a96f" "f5b6be56c9de9fd8bdd42e0c05fecb002dedb8f48a5f00e769370e4517dde0e8" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "aca70b555c57572be1b4e4cec57bc0445dcb24920b12fb1fea5f6baa7f2cad02" "3b8284e207ff93dfc5e5ada8b7b00a3305351a3fb222782d8033a400a48eca48" "249e100de137f516d56bcf2e98c1e3f9e1e8a6dce50726c974fa6838fbfcec6b" "c95813797eb70f520f9245b349ff087600e2bd211a681c7a5602d039c91a6428" "9cd57dd6d61cdf4f6aef3102c4cc2cfc04f5884d4f40b2c90a866c9b6267f2b3" "d516f1e3e5504c26b1123caa311476dc66d26d379539d12f9f4ed51f10629df3" "06ed754b259cb54c30c658502f843937ff19f8b53597ac28577ec33bb084fa52" "11cc65061e0a5410d6489af42f1d0f0478dbd181a9660f81a692ddc5f948bf34" "6128465c3d56c2630732d98a3d1c2438c76a2f296f3c795ebda534d62bb8a0e3" "3c7a784b90f7abebb213869a21e84da462c26a1fda7e5bd0ffebf6ba12dbd041" "e266d44fa3b75406394b979a3addc9b7f202348099cfde69e74ee6432f781336" "d9a28a009cda74d1d53b1fbd050f31af7a1a105aa2d53738e9aa2515908cac4c" "e8567ee21a39c68dbf20e40d29a0f6c1c05681935a41e206f142ab83126153ca" "2ce76d65a813fae8cfee5c207f46f2a256bac69dacbb096051a7a8651aa252b0" "57a29645c35ae5ce1660d5987d3da5869b048477a7801ce7ab57bfb25ce12d3e" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "3e200d49451ec4b8baa068c989e7fba2a97646091fd555eca0ee5a1386d56077" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" default))
 '(geiser-guile-binary "guile3.0")
 '(helm-completion-style 'emacs)
 '(package-selected-packages
   '(rustic dap-go helm-lsp lsp-ui dap-mode lsp-mode go-mode modus-themes svg-lib npm geiser-guile geiser nano-theme zenburn-theme kaolin-themes solarized-theme company-jedi elpy pdf-tools elpher tide flycheck tern xref-js2 js2-refactor js2-mode helm-ag wgrep-helm wgrep which-key projectile-rails projectile-rails-global-mode yari rinari bundler ruby-compilation inf-ruby web-mode auctex magit :magit zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((((class color) (min-colors 89)) (:foreground "#74736f")))))
