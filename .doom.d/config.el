;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Atemu"
      user-mail-address "atemu.main@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; Disable the annoying 1s delay on SPC
(setq which-key-idle-delay 0.01)

;; Disable smartparens (inserts a second ` ' " { etc.)
(smartparens-global-mode -1)

;; Enable rainbow delimiters everywhere
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Highlight trailing whitespaces in prog-mode
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; Disable auto-fill-mode by default (you can use M-q to refill manually)
(remove-hook 'text-mode-hook #'auto-fill-mode)
;; Disable auto-fill-mode in git commit aswell
(remove-hook 'git-commit-setup-hook #'git-commit-turn-on-auto-fill)

;; evil-mode
;; Enable hybrid keybinds (emacs keybinds in insert-mode)
(use-package evil
  :custom
  evil-disable-insert-state-bindings t
  )
;; evil-snipe
;; Disable 2-cahr sniping in evil-snipe. I prefer to have s be the default evil substitute
(map! :after evil-snipe
      :map evil-snipe-local-mode-map
      :n "s" nil
      :n "S" nil
      )

;; compay-mode
(setq
 ;; Disable completion popup delay
 company-idle-delay 0.01
 ;; Show completion immediately
 company-minimum-prefix-length 1
 )
(map! :after company
      (:map company-active-map
        "<tab>" #'company-complete-selection
        "<return>" #'evil-ret
        )
      )

;; helm
(map! :after helm
      ;; Restore some keybinds to default
      :map helm-map
      "C-l" #'helm-find-files-up-one-level
      "C-k" #'helm-delete-minibuffer-contents
      "C-v" #'helm-next-page
      "M-v" #'helm-previous-page
      "C-r" #'helm-minibuffer-history
      )

;; ivy
(map! :after ivy
      :map ivy-minibuffer-map
      ;; Restore some keybinds to default emacs ones ivy
      "C-k" #'ivy-kill-line
      "C-v" #'ivy-scroll-up-command
      "M-v" #'ivy-scroll-down-command
      "C-r" #'ivy-reverse-i-search
      "C-d" #'ivy-delete-char
      ;; Enhance with my own keybinds
      "<tab>" #'ivy-alt-done ;; Immediately select the current item
      "C-l" #'ivy-backward-kill-word
      "<backtab>" #'ivy-backward-kill-word
      )

;; Set default projectile switch project action to open magit
(after! 'counsel-projectile
  (counsel-projectile-modify-action
   'counsel-projectile-switch-project-action
   '((default counsel-projectile-switch-project-action-vc))))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
