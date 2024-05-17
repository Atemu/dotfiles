;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'nil

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; auto-completion
     ;; better-defaults
     c-c++
     debug
     docker
     emacs-lisp
     (git :variables git-enable-magit-delta-plugin t)
     groovy
     haskell
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     (ivy)
     (javascript)
     kotlin
     latex
     markdown
     multiple-cursors
     nixos
     org
     pdf
     python
     ranger
     rust
     (shell :variables shell-default-shell 'shell
            shell-default-term-shell "~/.local/state/nix/profile/bin/bash")
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     ;; syntax-checking
     (solidity :variables
               solidity-flycheck-solc-checker-active nil)
     systemd
     theming
     treemacs
     (version-control :variables version-control-diff-tool 'git-gutter)
     yaml
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(atomic-chrome
                                      adaptive-wrap
                                      bash-completion
                                      ctrlf
                                      disk-usage
                                      envrc
                                      gcmh
                                      nix-ts-mode
                                      git-annex
                                      ligature
                                      magit-annex
                                      mpv
                                      parrot
                                      (ivy-nixos-options :location (recipe :fetcher github :repo "travisbhartwell/nix-emacs")))

   ;; A list of packages that cannot be updated.
   ;; Currently no effect
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(forge ;; Conflicts with magit-annex and overrides the b n shortcut ...why?
                                    magit-gitflow ;; Conflicts with the worktree shortcut (%) and ...why tf would I want that?
                                    vterm) ;; needs to be compiled

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   ;; 8GiB, effectively disables GC
   dotspacemacs-gc-cons '(8000000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 10)
                                (projects . 10))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator nil)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Lucida Sans Typewriter" :size 16)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-,"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.200

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'nil

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; Put auto-generated custom-settings somewhere where they don't interfere
  ;; with VC
  (setq custom-file (concat spacemacs-cache-directory ".custom-settings"))
  (load custom-file)

  ;; Show diff in left fringe
  (setq version-control-diff-side 'left)

  ;; Don't evilify my minibuffers
  (setq hybrid-style-enable-hjkl-bindings nil)

  (setq
   ;; Make matching parens highlight while you type them
   evil-show-paren-range 1

   ;; No delay please
   show-paren-delay 0.01)

  ;; Don't attempt to use hasktags in haskell-mode; use xref/eglot/LSP
  (setq spacemacs-jump-handlers-haskell-mode '())

  (setq theming-modifications
        '((spacemacs-dark
           ;; Disable Spacemacs' org-mode heading font height adjustment
           ;; I prefer them to all be the same size
           (org-level-1 :height 1.0 :width normal :weight normal :bold normal)
           (org-level-2 :height 1.0 :width normal :weight normal :bold normal)
           (org-level-3 :height 1.0 :width normal :weight normal :bold normal)
           (org-level-4 :height 1.0 :width normal :weight normal :bold normal)
           (org-level-5 :height 1.0 :width normal :weight normal :bold normal)
           (org-level-6 :height 1.0 :width normal :weight normal :bold normal)
           (org-level-7 :height 1.0 :width normal :weight normal :bold normal)
           (org-level-8 :height 1.0 :width normal :weight normal :bold normal))

           (wombat
            (hl-line
             ;; Set color to something other than the selection color
             :background "gray10"
             ;; Do not underline
             :underline nil)
            ;; Unfuck ediff colour, it was an ugly yellow
            (ediff-current-diff-C "gray10")
            (ediff-fine-diff-C "gray10")

            (magit-section-highlight :background "gray10")
            (smerge-refined-added :background "#336633") ; magit-diff-added-highlight
            (smerge-refined-removed :background "##663333") ; magit-diff-removed-highlight



            ;; org-mode adjustments
            (org-headline-done :foreground "#99968b")
            (org-level-1 :foreground "#8ac6f2")
            (org-level-2 :foreground "#95e454")
            (org-level-3 :foreground "#cae682")
            (org-level-4 :foreground "#ccaa8f")
            (org-level-5 :foreground "#92a65e")
            )))

  ;; Let Emacs use all the CPUs it could need to compile native packages
  (setq comp-num-cpus 12
        warning-suppress-types '((comp))))

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; Don't use annoying GUI dialog boxes
  (setq use-dialog-box nil)

  ;; Don't try to update external packages
  ;; FIXME Don't override, append/prepend
  (setq dotspacemacs-frozen-packages
        (seq-filter
         (lambda (pkg)
           (string=
            (package-desc-status (cadr (assq pkg package-alist)))
            "external"))
         package-activated-list))

  ;; Don't pollute working dir with LockFiles
  (setq create-lockfiles nil)

  ;; Prevent undo tree files from polluting the filesystem
  (setq undo-tree-history-directory-alist `(("." . ,(concat spacemacs-cache-directory "undo-tree"))))

  ;; Don't pollute working dir with pdf-view-restore files either
  (setq pdf-view-restore-filename (concat spacemacs-cache-directory ".pdf-view-restore"))

  ;; Enable Garbage Collector Magic Hack
  (gcmh-mode 1)
  (setq gcmh-idle-delay 1)

  (with-eval-after-load 'ivy
    ;; Add HELM's minibuffer helm-find-files-up-one-level keybinding to Ivy
    (define-key ivy-minibuffer-map (kbd "C-l") 'counsel-up-directory)
    ;; Don't show extra dirs (you can go up one dir using C-l and use the current
    ;; completion (without current selection) using C-M-j)
    (setq ivy-extra-directories nil))

  ;; Open magit instead of project-find-files when switching projects
  (setq projectile-switch-project-action 'projectile-vc)
  ;; Make counsel-projectile do the same. Counsel needs special treatment for
  ;; some reason rather than simply consuming projectile-switch-project-action
  (with-eval-after-load 'counsel-projectile
    (counsel-projectile-modify-action
     'counsel-projectile-switch-project-action
     '((default counsel-projectile-switch-project-action-vc))))

  (defun path-in-nix-store-p (path)
    "Whether a given path is inside the Nix store or not."
    (string-prefix-p "/nix/store" path))
  (with-eval-after-load 'projectile
    (setq
     ;; Don't consider anything in the Nix store to be a project of any sort
     projectile-ignored-project-function 'path-in-nix-store-p

     projectile-project-search-path '(("~/Projects" . 1) ("~/Repos" . 1))))

  ;; Re-center the screen when switching swiper results
  (setq swiper-action-recenter t)

  (with-eval-after-load 'ctrlf
    (define-key ctrlf-minibuffer-mode-map (kbd "C-n") 'ctrlf-next-match)
    (define-key ctrlf-minibuffer-mode-map (kbd "C-p") 'ctrlf-previous-match)

    (setq ctrlf-auto-recenter t))

  ;; Enable ctrlf-mode; better isearch
  (ctrlf-mode)

  ;; Use fuzzy
  (define-key ctrlf-mode-map (kbd "C-s") 'ctrlf-forward-fuzzy)
  (define-key ctrlf-mode-map (kbd "C-r") 'ctrlf-backward-fuzzy)

  (with-eval-after-load 'magit
    ;; Exit transient buffers with ESC
    (define-key transient-base-map (kbd "<escape>") 'transient-quit-one)
    (evil-define-key 'normal magit-mode-map
      (kbd "C-n") 'evil-next-line
      (kbd "C-p") 'evil-previous-line
      (kbd "j") 'magit-section-forward
      (kbd "k") 'magit-section-backward)

    (setq
     ;; Make Magit open its buffer in the current window but use an existins split for diffs
     magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1

     ;; Fix Magit's horrendous Magit Rev (show commit) performance
     magit-revision-insert-related-refs nil
     ;; Don't show status headers (takes >2s in Nixpkgs)
     magit-status-headers-hook (delete 'magit-insert-tags-header magit-status-headers-hook)

     ;; Show time since commit in the left in magit-status
     magit-status-margin '(
                           t ; init
                           age ; style
                           magit-log-margin-width ; width
                           t ; author
                           18 ; author-width
                           )
     ;; Show branch names, tags etc. after commit message
     magit-log-show-refname-after-summary t

     ;; Don't ask to save buffers
     magit-save-repository-buffers nil

     ;; Makes magit-delta's colours less off
     ;; See https://github.com/dandavison/magit-delta/issues/24
     magit-delta-delta-args '("--true-color" "never" "--color-only")

     ;; customise default flags for transient actions
     transient-values '((magit-merge "--no-ff")))

    ;; I have diff.ignoreSubmodules=untracked in my git config which causes
    ;; Magit to show a warning atop the buffer. Disable that as it appears to be
    ;; inconsequential. https://github.com/magit/magit/discussions/5121
    (remove-hook 'magit-status-headers-hook
                 'magit-insert-diff-filter-header))

  (with-eval-after-load 'git-commit
    ;; Disable auto-fill-mode in git-commit-mode
    (remove-hook 'git-commit-setup-hook #'git-commit-turn-on-auto-fill)
    (defun my/git-commit-hook ()
      ;; My global fill-column is higher but git commits should really only have 80 chars
      (setq fill-column 80))
    (add-hook 'git-commit-setup-hook #'my/git-commit-hook))

  (with-eval-after-load 'evil-maps
    ;; Don't try to record evil macros if the buffer is read-only
    ;; Adapted from https://emacs.stackexchange.com/a/38364/26492
    (define-key evil-normal-state-map (kbd "q")
      (lambda ()
        (interactive)
        (if buffer-read-only
            (quit-window)
          (call-interactively 'evil-record-macro))))
    ;; Don't attempt to search for something in the current buffer as a
    ;; definition. This is not how any of this works.
    (delete 'evil-goto-definition-search evil-goto-definition-functions))

  (require 'ivy-nixos-options)

  ;; Why would I want to be spammed by that?
  (with-eval-after-load 'direnv
    (setq direnv-always-show-summary nil))

  (envrc-global-mode t)

  (with-eval-after-load 'eglot
    (setq
     ;; Shut down LSP after buffers are gone
     eglot-autoshutdown t
     ;; Don't spam minibuffer with irrelevant progress messages
     eglot-report-progress nil)
    ;; Make nix-ts-mode use same setup as nix-mode
    (add-to-list 'eglot-server-programs `(nix-ts-mode . ,(alist-get 'nix-mode eglot-server-programs))))

  (add-hook 'nix-mode-hook 'eglot-ensure)
  (add-hook 'nix-mode-hook
            (lambda ()
              (setq eglot-ignored-server-capabilities
                    (append eglot-ignored-server-capabilities '(:hoverProvider :documentHighlightProvider)))))

  (with-eval-after-load 'eldoc
    (setq
     ;; Don't make minibuffer jump between being a mini- and maxibuffer
     eldoc-echo-area-use-multiline-p nil)
    (add-hook
     'eglot-managed-mode-hook
     (lambda ()
       (setq
        eldoc-documentation-functions
        '(flymake-eldoc-function
          eglot-signature-eldoc-function
          eglot-hover-eldoc-function)))))

  (setq xref-show-definitions-function #'ivy-xref-show-defs)

  ;; Disable dante-mode as it doesn't work for me and I use eglot instead
  (setq haskell-completion-backend nil)

  ;; Adapted from https://200ok.ch/posts/2020-08-22_setting_up_spell_checking_with_multiple_dictionaries.html
  (with-eval-after-load "ispell" (let ((dict "en_GB,de_DE")) ;; Dict of my languages
    ;; Configure `LANG`, otherwise ispell.el cannot find a 'default
    ;; dictionary' even though multiple dictionaries will be configured
    ;; in next line.
    (setenv "LANG" "en_GB.UTF-8")
    (setq ispell-program-name "hunspell")
    ;; Configure German, Swiss German, and two variants of English.
    (setq ispell-dictionary dict)
    ;; ispell-set-spellchecker-params has to be called
    ;; before ispell-hunspell-add-multi-dic will work
    (ispell-set-spellchecker-params)
    (ispell-hunspell-add-multi-dic dict)
    ;; Make the en_GB,de_DE dict recognise ' as part of the word (i.e. "doesn't")
    (let ((item (cdr (assoc dict ispell-dictionary-alist))))
      (setf (nth 2 item) "[-.0-9ß']"))
    ;; For saving words to the personal dictionary, don't infer it from
    ;; the locale, otherwise it would save to ~/.hunspell_de_DE.
    (setq ispell-personal-dictionary "~/.hunspell_personal")))

  ;; Automatically uncompress mozlz4, Mozilla's weird and unnecessary lz4 wrapper
  (nconc jka-compr-compression-info-list
         '(["\\.\\(?:mozlz4\\|json\\.lz4\\|jsonlz4\\)\\'"
            "mozlz4 compressing"   "mozlz4a"         ("/dev/stdin" "/dev/stdout")
            "mozlz4 uncompressing" "mozlz4a"         ("/dev/stdin" "/dev/stdout" "-d")
            nil nil "mozLz40"])
         ;; Allow editing of binary .plist files.
         '(["\\.plist$"
            "converting text XML to binary plist"
            "plutil"
            ("-convert" "binary1" "-o" "-" "-")
            "converting binary plist to text XML"
            "plutil"
            ("-convert" "xml1" "-o" "-" "-")
            nil nil "bplist"]))
  (jka-compr-update)

  ;; Open mlterm with terminal-here
  (setq terminal-here-terminal-command (list "bash" "-c" "mlterm"))

  (atomic-chrome-start-server)

  ;; Make disk-usage show results without --apparent-size
  (setq disk-usage--du-args "-sB1")

  ;; parrot-mode can "rotate" words like true -> false etc.
  (define-key evil-normal-state-map (kbd "[r") 'parrot-rotate-prev-word-at-point)
  (define-key evil-normal-state-map (kbd "]r") 'parrot-rotate-next-word-at-point)
  (parrot-mode)

  ;; Enable adaptive-wrap globally
  ;; Taken from https://github.com/kaushalmodi/.emacs.d/blob/2015b51b2e0129e0af0d0efbb716b18f38038524/setup-files/setup-visual.el#L202-L218
  (use-package adaptive-wrap
    :config
    (progn
      (defun turn-on-adaptive-wrap-prefix-mode ()
        "Turns on adaptive-wrap-prefix-mode."
        (interactive)
        (adaptive-wrap-prefix-mode 1))
      (define-globalized-minor-mode global-adaptive-wrap-prefix-mode
        adaptive-wrap-prefix-mode
        turn-on-adaptive-wrap-prefix-mode)
      (global-adaptive-wrap-prefix-mode 1)))

  ;; Truncate lines with words-wrap
  (global-visual-line-mode)
  ;; Make adaptive-wrap-extra-indent buffer-local again
  (make-variable-buffer-local 'adaptive-wrap-extra-indent)
  ;; Enable visual-fill-column-mode in text-modes
  (defun custom-text-mode-hook ()
    (visual-fill-column-mode))
  (add-hook 'text-mode-hook #'custom-text-mode-hook)
  ;; We'e not in the 80's anymore
  (setq-default visual-fill-column-width 120)

  ;; Add extra indent to wrapped lines in prog-modes
  (defun custom-prog-mode-hook ()
    (setq adaptive-wrap-extra-indent 2))
  (add-hook 'prog-mode-hook #'custom-prog-mode-hook)

  ;; Immediately quit ediff on `q'
  ;; © Clément Lassieur CC BY-SA 3.0
  ;; https://emacs.stackexchange.com/a/24602/26492
  (defun disable-y-or-n-p (orig-fun &rest args)
    (cl-letf (((symbol-function 'y-or-n-p) (lambda (prompt) t)))
      (apply orig-fun args)))
  (advice-add 'ediff-quit :around #'disable-y-or-n-p)

  ;; Chmod the buffers currently visited file
  ;; © Wild Pottok CC BY-SA 4.0
  ;; https://emacs.stackexchange.com/a/72178/26492
  (defun chmod-this-file ()
    "chmod the file corresponding to the current buffer."
    (interactive)
    (setq modes (read-file-modes "File modes (octal or symbolic): " buffer-file-name))
    (chmod buffer-file-name modes))

  ;; From https://emacs.stackexchange.com/a/80954/26492
  ;; © Gilles CC BY-SA 4.0
  (defun match-region-indentation (beg end)
   "Match the region's indentation to its starting point.

  Call this function after yanking multiline indented text to match the yanked
  text to the indentation of the place where it was yanked.

  The first line of the yanked text must contain the indentation. Otherwise there
  is no way to know by how much the other lines are indented, and you should call
  \\[indent-rigidly] and manually specify by how much to reindent."
   (interactive "@*r")
    (save-excursion
      (goto-char beg)
      (let* ((target (current-column))
         (extra (progn
              (skip-syntax-forward "-" (line-end-position))
              (- (current-column) target))))
        (indent-rigidly (point) end (- target extra))
        (delete-region beg (point)))))

  (defun yank-and-match-indentation (&optional arg)
    "Yank (paste) the last killed text, matching the indentation at point.

  This is equivalent to \\[yank] followed by \\[match-region-indentation]."
    (interactive "*P")
    (yank arg)
    (match-region-indentation (mark) (point)))

  ;; Make the custom yank function be used on C-y
  ;; FIXME what about yank-pop?
  (substitute-key-definition 'yank 'yank-and-match-indentation global-map)

  ;; Spacemacs indents the yanked region by default which conflicts with this.
  ;; Disable that.
  (dolist (func '(yank))
    (advice-remove func #'spacemacs//yank-indent-region))

  ;; Switch buffers with SPC SPC
  (spacemacs/set-leader-keys "SPC" 'ivy-switch-buffer)

  ;; Collect garbage interactively
  (spacemacs/set-leader-keys "\\" 'garbage-collect)

  ;; Stage the current buffer's file
  (spacemacs/set-leader-keys "gS" 'magit-stage-buffer-file)

  ;; Make Magit git-annex integration accessible
  (spacemacs/set-leader-keys "g a" 'magit-annex-dispatch)

  ;; Split vertically no matter what
  (setq
   split-width-threshold 0
   split-height-threshold nil)

  ;; Right option gets interpreted as M- by default
  (setq mac-right-option-modifier "none"
        ;; MacPort turns the meta key into macOS' weird special character "option" key by default. No to that.
        mac-option-modifier '(:ordinary meta :function meta :mouse meta)
        ;; Default on macPort, just disables control? Why would you want that?
        mac-pass-control-to-system nil)
  ;; When disabled (default in spacemacs), emacsMacport goes to the background
  ;; when defocusing it by switching space or using mission control.
  ;; NS Emacs doesn't have this issue but "showing" the menu bar doesn't hurt
  ;; since it's the mac one that will be shown anyways.
  (when (string-equal system-type "darwin")
    (menu-bar-mode 1))
  ;; Transparent titlebar on macOS.
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))


  (require 'bash-completion)
  (bash-completion-setup)

  (with-eval-after-load 'org

    ;; Enable :ignore: tag
    (require 'ox-extra)
    (ox-extras-activate '(ignore-headlines))

    (setq
     ;; Explicitly enable indenting of content under headings
     org-adapt-indentation t

     org-todo-keywords '((sequence "TODO" "|" "DONE" "ABRT"))))

  ;; Monday is the start of the week.
  (setq calendar-week-start-day 1)

  (define-ibuffer-filter read-only
      "Limit current view to buffers that are read-only."
    (:description "read-only"
     :reader nil)
    (buffer-local-value 'buffer-read-only buf))

  (define-ibuffer-filter writable
      "Limit current view to buffers that are writable."
    (:description "writable"
                  :reader nil)
    (not (buffer-local-value 'buffer-read-only buf)))

  (define-key ibuffer--filter-map (kbd "w") #'ibuffer-filter-by-writable)
  (define-key ibuffer--filter-map (kbd "W") #'ibuffer-filter-by-read-only)

  ;; Put LaTeX tmp files into /tmp/ instead of working dir
  ;; https://tex.stackexchange.com/a/111965
  (add-hook 'LaTeX-mode-hook (lambda ()
                              (push
                               '("Latex_outdir" "%`pdflatex --output-directory=/tmp %(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run pdflatex with output in /tmp")
                               TeX-command-list)))
  (setq latex-build-command "Latex_outdir")

  ;; Highlight values in comments in nix-mode
  ;; TODO all prog-modes should do this
  (font-lock-add-keywords 'nix-mode '(("`\\([a-z-]+\\)'" 1 'font-lock-constant-face prepend)))

  ;; Enable ligatures
  (require 'ligature)
  (global-ligature-mode t)
  ;; Currently supported ligatures in hasklig
  (ligature-set-ligatures 'text-mode '("<*" "<*>" "<+>" "<$>" "***" "<|" "|>"
                                       "<|>" "!!" "||" "===" "==>" "<<<" ">>>"
                                       "<>" "+++" "<-" "->" "=>" ">>" "<<" ">>="
                                       "=<<" ".." "..." "::" "-<" ">-" "-<<"
                                       ">>-" "++" "/=" "=="))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
