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
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(;; +checkers
     spell-checking
     syntax-checking

     ;; +completion
     auto-completion
     ivy

     ;; +emacs
     ibuffer
     org
     typography

     ;; +filetree
     treemacs

     ;; +lang
     agda
     asciidoc
     asm
     bibtex
     c-c++
     (clojure :variables
              clojure-enable-fancify-symbols t)
     coq
     csharp
     csv
     d
     elm
     emacs-lisp
     ess
     fsharp
     go
     gpu
     graphviz
     (haskell :variables
              haskell-completion-backend 'intero
              haskell-enable-hindent-style "johan-tibell")
     html
     idris
     ipython-notebook
     java
     javascript
     json
     julia
     latex
     lua
     markdown
     php
     purescript
     python
     racket
     restructuredtext
     ruby
     rust
     scala
     scheme
     shell-scripts
     sql
     swift
     typescript
     vimscript
     yaml

     ;; +os
     osx

     ;; +source-control
     (git :variables
          git-gutter-use-fringe t)
     version-control

     ;; +spacemacs
     spacemacs-completion
     spacemacs-defaults
     spacemacs-editing
     spacemacs-editing-visual
     spacemacs-evil
     spacemacs-layouts
     spacemacs-org
     spacemacs-project
     spacemacs-purpose
     spacemacs-visual

     ;; +themes
     colors

     ;; +tools
     ansible
     finance
     nginx
     (shell :variables
            shell-default-shell 'eshell
            shell-default-term-shell "/usr/local/bin/fish")
     terraform

     ;; +vim
     evil-commentary
     (evil-snipe :variables
                 evil-snipe-enable-alternate-f-and-t-behaviors t)
     vinegar)

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages
   '((grace-mode :location (recipe
                            :fetcher github
                            :repo "zmthy/grace-mode"))
     (scribble-mode :location (recipe
                               :fetcher github
                               :repo "emacs-pe/scribble-mode")))

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

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
   dotspacemacs-gc-cons '(100000000 0.1)

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
   dotspacemacs-editing-style 'vim

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
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes (let ((themes '(spacemacs-light
                                       spacemacs-dark)))
                         (if (dark-modep)
                             (reverse themes)
                           themes))

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("InconsolataLGC Nerd Font"
                               :size 11
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

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
   dotspacemacs-distinguish-gui-tab nil

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
   dotspacemacs-which-key-delay 0.4

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
   dotspacemacs-maximized-at-startup nil

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
   dotspacemacs-line-numbers 'visual

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

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
   dotspacemacs-whitespace-cleanup 'all

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
  (setq cedille-path "/usr/local/share/emacs/site-lisp/cedille")
  (require 'cedille-mode)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defmacro add-hooks (&rest hooks)
  "Register a number of hooks at once, with the hook names auto-quoted.
Provide program bodies rather than functions for the hook values."
  `(progn . ,(mapcar (lambda (hook)
                       `(add-hook ',(car hook)
                                  (lambda () (progn . ,(cdr hook)))))
                     hooks)))

(defmacro add-text-modes (&rest hooks)
  "Register all of the given hooks as having the expected behaviour of a
text-mode."
  `(add-hooks . ,(mapcar (lambda (hook)
                           `(,hook (setq sentence-end-double-space t)
                                   (auto-fill-mode)))
                         hooks)))

(defmacro hook-setq (&rest binds)
  "Register a function for a hook that sets the given variables."
  `(add-hooks . ,(mapcar (lambda (bind)
                           `(,(car bind) (setq-default . ,(cdr bind))))
                         binds)))

(defun applescript (lines)
  "Executes a list of lists of primitive objects as AppleScript.
Returns the exit code."
  (when-let ((osascript (executable-find "osascript")))
    (with-temp-buffer
      (let ((buffer (current-buffer)))
        (dolist (line lines)
          (when line
            (prin1 (car line) buffer)
            (dolist (object (cdr line))
              (insert " ")
              (prin1 object buffer)))
          (insert "\n")))
      (call-process-region (point-min) (point-max) osascript))))

(defun dark-modep ()
  "Determine if macOS is currently in dark mode."
  (zerop (applescript '((tell application "System Events")
                        (tell appearance preferences)
                        (if get dark mode is false then)
                        (error number 1)
                        (end if)
                        (end tell)
                        (end tell)))))

(defun match-macos-theme ()
  "Update the theme to light or dark depending on current the macOS theme."
  (interactive)
  (when (equal spacemacs--cur-theme (if (dark-modep) 'spacemacs-light 'spacemacs-dark))
    (spacemacs/cycle-spacemacs-theme)))

(defun magit-fetch-into-local (remote branch args)
  "Fetch a remote branch into the matching local branch."
  (interactive
   (list (magit-read-remote-or-url "Fetch from remote or url" "origin")
         (magit-read-branch "Fetch into local branch" "develop")
         (magit-fetch-arguments)))
  (magit-git-fetch remote (cons (concat branch ":" branch) args)))

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  (run-at-time 0 300 'match-macos-theme)

  ;; Add "into local" command for the magit fetch popup after "explicit refspec".
  (spacemacs|use-package-add-hook magit
    :post-config
    (transient-append-suffix 'magit-fetch "r" '("i" "into local" magit-fetch-into-local))
    (transient-append-suffix 'magit-push "-n" '("-s" "Skip Gitlab CI" "--push-option=ci.skip")))

  (setq-default

   ;; Fill column at 80.
   fill-column 80

   ;; Sentences are followed by only one space.
   sentence-end-double-space nil

   ;; Don't move past eol.
   evil-move-beyond-eol nil

   ;; Set the default indentation to 2, instead of 4.
   standard-indent 2
   evil-shift-width 2
   sh-basic-offset 2)

  ;; Alert on trailing whitespace, and show tabs to distinguish from spaces.
  (setq whitespace-style '(face trailing tab tab-mark))

  ;; Disable cleverparens movement: use evil-lisp-state instead.
  (setq evil-cleverparens-use-additional-movement-keys nil)

  ;; Disable overly optimistic autocomplete in eshell.
  (spacemacs|disable-company eshell-mode)

  (add-hooks
   ;; Set up cleverparens mode for lisps.
   (clojure-mode-hook (evil-cleverparens-mode))
   (emacs-lisp-mode-hook (evil-cleverparens-mode))
   (racket-mode-hook (evil-cleverparens-mode))
   (scheme-mode-hook (evil-cleverparens-mode)))

  ;; Make text modes use double spacing and auto-fill.
  (add-text-modes text-mode-hook
                  markdown-mode-hook
                  latex-mode-hook
                  scribble-mode-hook)

  ;; Provide remaining mode settings.
  (hook-setq

   ;; Emacs Lisp and Racket aren't text modes, but should still use double
   ;; spacing.
   (emacs-lisp-mode-hook sentence-end-double-space t)
   (racket-mode-hook sentence-end-double-space t)

   ;; Git commit is a text mode, but shouldn't use double spacing.
   (git-commit-mode-hook sentence-end-double-space nil
                         git-commit-summary-max-length 50
                         git-commit-fill-column 72)

   ;; Haskell's indentation is 4, and where is indented by 2.
   (haskell-mode-hook haskell-indentation-layout-offset 4
                      haskell-indentation-starter-offset 4
                      haskell-indentation-left-offset 4
                      haskell-indentation-where-pre-offset 2
                      haskell-indentation-where-post-offset 2
                      evil-shift-width 4

                      ;; Snap framework standard.
                      fill-column 78

                      ;; Stylish should be run on save.
                      haskell-stylish-on-save t)

   ;; Setup the text-mode standards without auto-fill-mode for Literate Agda.
   (agda2-mode-hook sentence-end-double-space t)

   ;; JavaScript should indent by 2.
   (js2-mode-hook js2-basic-offset 2
                  evil-shift-width 2

                  ;; Assume both Node and browser definitions.
                  js2-include-browser-externs t
                  js2-include-node-externs t)

   ;; Rust should indent by 4.
   (rust-mode-hook evil-shift-width 4)

   ;; CSS should indent by 2.
   (css-mode-hook css-indent-offset 2
                  evil-shift-width 2)

   ;; TypeScript should indent by 4.
   (typescript-mode-hook evil-shift-width 4)

   ;; Clojure indent as in Cursive and fill column is 120.
   (clojure-mode-hook clojure-indent-style :align-arguments
                      fill-column 120))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol t)
 '(fish-indent-offset 2)
 '(package-selected-packages
   (quote
    (ace-jump-helm-line ace-link aggressive-indent auctex auctex-latexmk auto-compile auto-highlight-symbol browse-at-remote centered-cursor-mode cider clean-aindent-mode column-enforce-mode csv-mode define-word devdocs diff-hl diminish doom-modeline dotenv-mode dumb-jump editorconfig elisp-slime-nav eval-sexp-fu evil-anzu evil-args evil-cleverparens evil-ediff evil-escape evil-exchange evil-goggles evil-iedit-state evil-indent-plus evil-lion evil-lisp-state evil-magit evil-matchit evil-mc evil-nerd-commenter evil-numbers evil-surround evil-textobj-line evil-tutor evil-unimpaired evil-visual-mark-mode evil-visualstar expand-region eyebrowse fancy-battery fill-column-indicator flx-ido flycheck-package font-lock+ fringe-helper git-commit git-gutter git-gutter+ git-gutter-fringe git-gutter-fringe+ git-link git-messenger git-timemachine gitattributes-mode gitconfig-mode gitignore-mode gitignore-templates golden-ratio google-translate helm-ag helm-descbinds helm-flx helm-git-grep helm-gitignore helm-make helm-mode-manager helm-projectile helm-purpose helm-swoop helm-themes helm-xref highlight-indentation highlight-numbers highlight-parentheses hl-todo hungry-delete indent-guide link-hint lorem-ipsum macrostep magit magit-gitflow magit-popup magit-svn mmm-mode move-text nameless open-junk-file org-bullets org-plus-contrib overseer paradox password-generator pcre2el persp-mode popwin rainbow-delimiters rainbow-mode request restart-emacs smeargle spaceline-all-the-icons string-inflection symbol-overlay symon toc-org transient use-package uuidgen vi-tilde-fringe volatile-highlights which-key winum with-editor writeroom-mode ws-butler)))
 '(psc-ide-add-import-on-completion t t)
 '(psc-ide-rebuild-on-save nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
