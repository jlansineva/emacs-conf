(setq-default indent-tabs-mode nil)

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
;; yes / no -> y / n
(fset 'yes-or-no-p 'y-or-n-p)
(setq create-lockfiles nil)
(setq inhibit-startup-message t)
;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; groupit
(setq ibuffer-saved-filter-groups 
      '(("harja" 
         ("REPL" (name . "\*cider\*"))
         ("Views" (filename . "views"))
         ("Tiedot" (filename . "tiedot"))
         ("ClojureScript" (and (not (filename . "views"))
                               (not (filename . "tiedot"))
                               (mode . clojurescript-mode)))
         ("Clojure" (mode . clojure-mode))
         ("Domain" (mode . clojurec-mode))
         ("Less" (mode . less-css-mode))
         ("SQL" (mode . sql-mode))
         ("Cypress" (filename . "cypress"))
         ("Tests" (filename . "_test")))
        ("clojure" 
         ("REPL" (name . "\*cider\*"))
         ("ClojureScript" (mode . clojurescript-mode))
         ("Clojure" (mode . clojure-mode))
         ("ClojureC" (mode . clojurec-mode))
         ("Less" (mode . less-css-mode))
         ("SQL" (mode . sql-mode))
         ("Cypress" (filename . "cypress"))
         ("Tests" (filename . "_test")))))

(setq ibuffer-show-empty-filter-groups nil)

(add-hook 'ibuffer-mode-hook
          #'(lambda () 
             (ibuffer-switch-to-saved-filter-groups "harja")))
