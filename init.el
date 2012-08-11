
(add-to-list 'load-path "~/.emacs.d/elisp/")
;;--------------------------------------------------------------------
;;
;; set default style to Google C Style

(load-file "~/.emacs.d/elisp/google-c-style.el")
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;;------------------------------------------------------------------------
;; POPUP
;; https://github.com/m2ym/popup-el/blob/v0.4/README.markdown
(require 'popup)

;;------------------------------------------------------------------------
;; AUTO-COMPLETE
;; http://cx4a.org/software/auto-complete/manual.html#Installation
(add-to-list 'load-path "~/.emacs.d/elisp/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/auto-complete/ac-dict")
(ac-config-default)

;;------------------------------------------------------------------------
;; AC-SLIME
;; https://github.com/purcell/ac-slime

(add-to-list 'load-path "~/.emacs.d/elisp/ac-slime")
(require 'ac-slime)
 (add-hook 'slime-mode-hook 'set-up-slime-ac)
 (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
 (eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'slime-repl-mode))

;;------------------------------------------------------------------------
;; YASNIPPET
;; https://github.com/capitaomorte/yasnippet/
(add-to-list 'load-path "~/.emacs.d/elisp/yasnippet")
(require 'yasnippet)
(setq yas/snippet-dirs
      '("/home/ambantis/.emacs.d/elisp/HTML5-YASnippet-bundle"
	"/home/ambantis/.emacs.d/elisp/yasnippet/snippets"))
(yas/initialize)
(yas/global-mode 1)

;;------------------------------------------------------------------------
;; ZENCODING
;; https://github.com/rooney/zencoding
(add-to-list 'load-path "~/.emacs.d/elisp/zencoding")
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes

;;------------------------------------------------------------------------
;;
;;  org-mode
;;

(setq load-path (cons "/usr/share/emacs/site-lisp" load-path))
(setq load-path (cons "/usr/share/emacs/site-lisp/org_contrib/lisp" load-path))

(require 'org-install)

;; The following lines are needed to begin emacs.
(add-to-list 'auto-mode-alist '("~/Documents/emacs/org/*.org" . org-mode))
(add-to-list 'auto-mode-alist '("~/Documents/emacs/org/lausd/*.org" . org-mode))

;; not needed when global-font-lock-mode is on:
(add-hook 'org-mode-hook 'turn-on-font-lock) 
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(add-to-list 'load-path "~/Documents/emacs/org")
(add-to-list 'load-path "~/Documents/emacs/org/archive")
(add-to-list 'load-path "~/Documents/emacs/org/home")
(add-to-list 'load-path "~/Documents/emacs/org/lausd")
(add-to-list 'load-path "~/Documents/emacs/org/compsci")

;; org-mode clean outline view
(setq org-hide-leading-stars 1)

(setq org-agenda-files
      (list "~/Documents/emacs/org/compsci/hack.org"
            "~/Documents/emacs/org/home/journal.org"
            "~/Documents/emacs/org/temp.org"
            "~/Documents/emacs/org/lausd/admin.org"
            "~/Documents/emacs/org/lausd/advisory.org"
            "~/Documents/emacs/org/lausd/algebra.org"      
            "~/Documents/emacs/org/lausd/biology.org"
            "~/Documents/emacs/org/lausd/chemistry.org"
            "~/Documents/emacs/org/lausd/history.org"
            "~/Documents/emacs/org/lausd/life-skills.org"
            "~/Documents/emacs/org/lausd/science.org"))

(setq org-todo-keywords
      '((sequence "OPEN(o/!)" "TODO(t)" "WAIT(w@/!)" "|"
                  "DONE(d!)" "CANCELLED(c@)")))

;; org-mode archive location
(setq org-archive-location "~/Documents/emacs/archive/%s_archive::")

;; launch shell applications without dialog box
(setq org-confirm-shell-link-function nil)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (ditaa . nil)
   (dot . nil)
   (emacs-lisp . nil)
   (gnuplot . nil)
   (haskell . nil)
   (latex . nil)
   (ledger . nil)
   (ocaml . nil)
   (octave . nil)
   (python . t)
   (R . nil)
   (ruby . nil)
   (screen . nil)
   (sh . t)
   (sql . t)
   (sqlite . t)))

;; inhibits the insertion of blank lines on tangling.
;; http://osdir.com/ml/emacs-orgmode-gnu/2010-10/msg00527.html
(setq org-babel-tangle-pad-newline nil)
;; Resume clocking tasks when emacs is restarted
(org-clock-persistence-insinuate)
;; Yes it's long... but more is better ;)
(setq org-clock-history-length 28)
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)
;; Separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK" "CLOCK" "CODE")))
;; Save clock data in the CLOCK drawer and state changes and notes in
;; the LOGBOOK drawer
(setq org-clock-into-drawer "CLOCK")
;; Save comments data into the LOGBOOK drawer
(setq org-log-into-drawer "LOGBOOK")
;; Sometimes I change tasks I'm clocking quickly - this removes
;; clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)
;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)
;; Save the running clock and all clock history when exiting Emacs,
;; load it on startup
(setq org-clock-persist (quote history))
;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution 
      (quote when-no-clock-is-running))
;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)

;; tag settings
(setq org-tag-alist '(("@mclc" . ?m) ("@home" . ?h)
                      ("@cafe" . ?c) ("@shop" . ?s)
                      ("@phone" . ?p) ("@laptop" . ?l)))

;; activate capture mode
(setq org-directory "~/Documents/emacs/org/")
(setq org-default-notes-file (concat org-directory "home/journal.org"))
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
 '(("t" "Todo" entry (file+headline "~/Documents/emacs/org/temp.org" "Tasks")
    "* TODO %?\n  CREATED: %U\n %i\n %a")
   ("j" "Journal" entry (file+datetree "~/Documents/emacs/org/home/journal.org")
    "* %?\nEntered on %U\n  %i\n  %a")))

; Use IDO for target completion
(setq org-completion-use-ido t)

; Targets include this file and any file contributing to the agenda -
; up to 5 levels deep
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 5)
                         (nil :maxlevel . 5))))

; Targets start with the file name - allows creating level 1 tasks
(setq org-refile-use-outline-path (quote file))

; Targets complete in steps so we start with filename, TAB shows the
; next level of targets etc
(setq org-outline-path-complete-in-steps t)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))


;;------------------------------------------------------------------------
;; POPWIN
;; https://github.com/m2ym/popwin-el
(add-to-list 'load-path "~/.emacs.d/elisp/popwin-el")
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
;;(push "*SLIME Compilation*" popwin:special-display-config) 
;;(push '(sldb-mode :stick t) popwin:special-display-config)

;;--------------------------------------------------------------------
;;
;; CCRYPT
;;
(setq load-path (cons "~/.emacs.d/elisp/" load-path))
(require 'ps-ccrypt "ps-ccrypt.el")

;;--------------------------------------------------------------------
;;
;; YASNIPPET & ZENCODING MODES
;;
;;(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.6.1/"
;;(require 'yasnippet)
;;(setq yas/root-directory "~/.emacs.d/elpa/yasnippet-0.6.1/snippets")
;;(yas/load-directory yas/root-directory)

;;(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; auto-start on any markup modes

;;--------------------------------------------------------------------
;;
;; MARKDOWN-MODE
;;
;; http://jblevins.org/projects/markdown-mode/
(add-to-list 'load-path "~/.emacs.d/elisp/markdown-mode/")
(autoload 'markdown-mode "markdown-mode.el")
(add-to-list 'auto-mode-alist '("\\.md\\'"  . markdown-mode))

;;--------------------------------------------------------------------
;; MAKEFILE-MODE
;;
;; http://www.emacswiki.org/emacs/MakefileMode
;; allow .mak files to automatically use makefile-mode
(add-to-list 'auto-mode-alist '("\\.mak\\'" . makefile-mode))

;;--------------------------------------------------------------------
;;
;; LEDGER-MODE
;;
;; https://github.com/jwiegley/ledger/ 

(require 'ledger)
(add-to-list 'auto-mode-alist '("\\.ldg\\'" . ledger-mode))

;;--------------------------------------------------------------------
;;
;; CLOJURE MODE
;;
;; https://github.com/technomancy/clojure-mode
(add-to-list 'load-path "~/.emacs.d/elisp/clojure-mode/")
(require 'clojure-mode)

;; http://www.clojuremadesimple.co.uk/
(global-set-key (kbd "C-c C-j") 'clojure-jack-in)

;;--------------------------------------------------------------------
;;
;; RAINBOW-DELIMITERS-MODE
;; https://github.com/jlr/rainbow-delimiters/

(add-to-list 'load-path "~/.emacs.d/elisp/rainbow-delimiters/")
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)


;;--------------------------------------------------------------------
;;
;; PAREDIT
;;
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)

;; https://github.com/technomancy/clojure-mode
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

;; add show-paren-mode to make it easier to read lisp syntax
(show-paren-mode)
;; ensure that there is no delay in showing matching paren
;;http://emacswiki.org/emacs/ShowParenMode
(setq show-paren-delay 0)

;;--------------------------------------------------------------------
;;
;; GNU-GO
(require 'gnugo)

;;--------------------------------------------------------------------

(add-to-list 'auto-mode-alist
     (cons (concat "\\." (regexp-opt '("xml" "xsd" "sch" "rng" 
                                       "xslt" "svg" "rss") t) "\\'")
           'nxml-mode))

;;--------------------------------------------------------------------
;;
;; WORD COUNT MODE
;;
(setq load-path (cons (expand-file-name "~/.emacs.d/elisp") load-path))
(autoload 'word-count-mode "word-count"
           "Minor mode to count words." t nil)
(global-set-key "\M-+" 'word-count-mode)
;;
;; How to use:
;; 1). M-+ (word-count-mode) toggles word-count mode.
;; 2). M-[space] (word-count-set-area) sets area for
;;     counting words.
;; 3). M-x word-count-set-region sets region or paragraph 
;;     for counting words.
;; 4). M-x word-count-set-marker sets marker for counting 
;;     words.
;;--------------------------------------------------------------------
;;
;; UNFILL PARAGRAPH
;;
;; Stefan Monnier <foo at acm.org>. It is the opposite of
;; fill-paragraph
(defun unfill-paragraph ()
    "Takes a multi-line paragraph and makes it into a single
     line of text."
    (interactive)
    (let ((fill-column (point-max)))
    (fill-paragraph nil)))

;;--------------------------------------------------------------------
;;
;; WINDMOVE
;; http://www.emacswiki.org/emacs/WindMove
;;
;; Windmove is a library built into GnuEmacs starting with version
;; 21. It lets you move point from window to window using Shift and
;; the arrow keys. This is easier to type than ‘C-x o’ and, for some
;; users, may be more intuitive.
(windmove-default-keybindings)

;;--------------------------------------------------------------------
;;
;; FORMAT/APPEARANCE SETTINGS
;;
;; auto-fill minor mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; allow f11 full-screen mode toggle
;; do: sudo-apt-get install wmctrl
(defun switch-full-screen ()
      (interactive)
      (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))
(global-set-key [f11] 'switch-full-screen)

;; set default window size
(add-to-list 'default-frame-alist '(height . 42))
(add-to-list 'default-frame-alist '(width . 80))

;;integrate with X11 copy/paste
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 
      'x-cut-buffer-or-selection-value)

;; remove tool bar
(tool-bar-mode -1)

;; show column-number in mode line
(column-number-mode t)

;; show file size
(size-indication-mode)

;; line numbers
(setq line-number-mode t)

;; column width to 70
(setq-default fill-column 70)

;; set default font
(set-default-font "Droid Sans Mono-11")
(setq w32-enable-synthesized-fonts t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(require 'color-theme)
;;(load-file "~/.emacs.d/elisp/zenburn.el")
(load-theme 'zenburn t)

;; my location for sunrise/sunset:
(setq calendar-latitude 34.1)
(setq calendar-longitude -118.2)
(setq calendar-location-name "Los Angeles, CA")

;;startup screens
(setq inhibit-startup-message t)
(dired "~/Documents/dev")
(dired "~/Documents/emacs/org")

;; add dired-x
(add-hook 'dired-load-hook
          (function (lambda () (load "dired-x"))))

;; i want backups, but not littering everywhere
(setq backup-directory-alist '(("." . "~/Documents/emacs/.backups/")))
(setq backup-by-copying t)
;; version backup files
(setq version-control t)
;; save this many recent backups
(setq kept-new-versions 10)	
;; save this many older backups
(setq kept-old-versions 10)
;; but don't keep unlimited versions
(setq delete-old-versions t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(battery-mode-line-format "[%b%p%%]")
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(display-battery-mode t)
 '(fringe-mode 0 nil (fringe))
 '(org-src-window-setup (quote current-window))
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tabkey2-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
