;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Load path etc:

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))
(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session:

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; Load up ELPA, the package manager:

(require 'package)
(package-initialize)
;;(require 'starter-kit-elpa)

;; Load up starter kit customizations:

(require 'starter-kit-defuns)
(require 'starter-kit-bindings)
(require 'starter-kit-misc)
(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-ruby)
;; (require 'starter-kit-js)

(regen-autoloads)
(load custom-file 'noerror)

;; You can keep system- or user-specific customizations here:
(load-file "~/.emacs.d/themes/railscasts.el")
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-railscasts)
(setq mac-allow-anti-aliasing nil)

(require 'linum)

;; Yasnippets - Textmate style snippets
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;; erlang mode
(setq load-path (cons "/usr/local/Cellar/erlang/R13B03/lib/erlang/lib/tools-2.6.5/emacs" load-path))
(setq erlang-root-dir "/usr/local/Cellar/erlang/R13B03/lib/erlang")
(setq exec-path (cons "/usr/local/Cellar/erlang/R13B03/lib/erlang/bin" exec-path))
(require 'erlang-start)

(add-to-list 'load-path "~/.emacs.d/vendor")
(require 'haml-mode)

;; Stop that insane emacs default scrolling
;;(require 'smooth-scrolling)
(setq mouse-wheel-progressive-speed nil)
(setq show-trailing-whitespace t)

(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el"))

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))

(provide 'init)
;;; init.el ends here