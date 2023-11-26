(require 'package)

(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(magit . "melpa-stable") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(paredit
    clojure-mode
    clojure-mode-extra-font-locking
    cider
    rainbow-delimiters
    ido-completing-read+
    magit
    flycheck-clj-kondo
    amx
    dash
    dired-hacks-utils
    dired-subtree
    zenburn-theme
    markdown-mode
    treemacs
    gptel
    s
    dash
    editorconfig))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

;; 
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (pak my-packages)
  (when (not (package-installed-p pak))
    (package-install pak)))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(add-to-list 'load-path "~/.emacs.d/customizations")

(load "clojure.el")

(add-to-list 'load-path "~/projects/copilot.el")
(setq copilot-node-executable "~/.nvm/versions/node/v18.13.0/bin/node")
(require 'copilot)

(load "copilot-conf.el")

(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-auto-merge-work-directories-length -1)
(ido-ubiquitous-mode t)
(ido-everywhere t)

(load "config.el")

(require 'golden-ratio)

(golden-ratio-mode 1)
(setq golden-ratio-auto-scale t)

(require 'editorconfig)
(editorconfig-mode 1)

(setq ns-alternate-modifier 'meta)
(setq ns-right-alternate-modifier 'none)
(setq mac-command-modifier 'control)
(setq mac-option-modifier 'meta)

(load-theme 'solarized-dark-high-contrast t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "20a8ec387dde11cc0190032a9f838edcc647863c824eed9c8e80a4155f8c6037" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "9abe2b502db3ed511fea7ab84b62096ba15a3a71cdb106fd989afa179ff8ab8d" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "78e9a3e1c519656654044aeb25acb8bec02579508c145b6db158d2cfad87c44e" default))
 '(package-selected-packages
   '(golden-ratio typescript-mode gptel ws-butler cyberpunk-theme solarized-theme monokai-theme spacemacs-theme zenburn-theme flycheck-clj-kondo ido-completing-read+ rainbow-delimiters cider clojure-mode-extra-font-locking clojure-mode paredit exec-path-from-shell magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
