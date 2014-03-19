;; .emacs
(setq ansi-color-for-comint-mode t)
(customize-group 'ansi-colors)
(kill-this-buffer)              

;; Don't display menu bar. Type M-x menu-bar-mode to display it
(menu-bar-mode '-1)
;; Don't display tool bar. Type M-x tool-bar-mode to display it
(if (not (equal (getenv "HOSTTYPE") "sparc"))
    (tool-bar-mode '-1))

(defun linux-c-mode ()
	"C mode with adjusted defaults for use with the Linux kernel."
	(interactive)
	(c-mode)
	(c-set-style "K&R")
	(setq tab-width 8)
	(setq indent-tabs-mode t)
	(setq c-basic-offset 8)
)

(defun	my-c-mode ()
	"C mode with adjusted defaults for use with the C sources."
	(interactive)
	(c-mode)
	(c-set-style "K&R")
	(setq tab-width 8)
	(setq indent-tabs-mode t)
	(setq c-basic-offset 8)
)

(defun	my-c++-mode ()
	"C++ mode with adjusted defaults for use with the C++ sources."
	(interactive)
	(c++-mode)
	(c-set-style "K&R")
	(setq tab-width 4)
	(setq indent-tabs-mode t)
	(setq c-basic-offset 4)
)

(defun	my-asm-mode ()
	"ASM mode with adjusted defaults for use with the asm sources."
	(interactive)
	(asm-mode)
	(setq tab-width 8)
	(setq indent-tabs-mode t)
	(setq c-basic-offset 8)
)

(setq auto-mode-alist (cons '(".*\\.\\(inl$\\|cxx$\\|hxx$\\|cpp$\\|hpp$\\)" .
			my-c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '(".*\\.\\(inc$\\|[Ss]$\\)" .
			my-asm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '(".*\\.\\(inl$\\|c$\\|h$\\)" .
			my-c-mode) auto-mode-alist))
(setq auto-mode-alist (cons '(".*/*linux.*/+.*\\.[ch]$" .
			linux-c-mode) auto-mode-alist))

(setq witch-function-mode t)
(which-func-mode)

;; This maps edit keys to standard Windows keystokes. It requires the
;; library cua-mode.el from Kim Storm at the following URL:
(load "~/cua-mode.el")
(CUA-mode t)

;; Set foreground and background. black or dimgrey may be choosed
(set-foreground-color "white")
(set-background-color "gray11")
;set-background-color "CornflowerBlue")
;(set-background-color "DarkSlateBlue")
;(set-background-color "MidnightBlue")
;(set-background-color "Black")

;; Set the mouse and cursor color
(set-mouse-color "yellow")
(set-cursor-color "red")

(setq Man-overstrike-face 'info-node)
(setq Man-underline-face 'info-xref)

(shell)
(rename-buffer "aaaa-shell")
(shell)
(rename-buffer "bbbb-shell")
(shell)
(rename-buffer "cccc-shell")
(shell)
(rename-buffer "dddd-shell")
(shell)
(rename-buffer "eeee-shell")
(shell)
(rename-buffer "ffff-shell")
(shell)
(rename-buffer "make-shell")
(shell)
(rename-buffer "work-shell")

(show-paren-mode)
(global-auto-revert-mode)

;;; uncomment this line to disable loading of "default.el" at startup
;;(setq inhibit-default-init t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

(add-hook 'comint-output-filter-functions
	'comint-watch-for-password-prompt)

(setq display-time-24hr-format t)
(setq display-time-day-and-date nil)
(display-time)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(setq column-number-mode t)
;;(setq line-number-mode t)

;;yk--quick start
(setq inhibit-startup-message t)

;;high line
;(require 'hl-line)
;(global-hl-line-mode t)

;;tab
;(require 'tabbar)
;(tabbar-mode)
;(global-set-key (kbd "M-[") 'tabbar-backward-group)
;(global-set-key (kbd "M-]") 'tabbar-forward-group)
;(global-set-key (kbd "M-p") 'tabbar-backward-tab)
;(global-set-key (kbd "M-n") 'tabbar-forward-tab)

(column-number-mode t)

(setq make-backup-files nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(display-time-mode t)
 '(semantic-c-dependency-system-include-path (quote ("/usr/include" "/home/ykli/work/kernel/kernel-3.0.8/include" "/home/ykli/work/kernel/kernel-3.0.8/arch/mips/include" "/home/ykli/work/kernel/kernel-3.0.8/arch/mips/xburst/soc-4780/include")))
 '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(global-font-lock-mode t nil (font-lock))
 '(next-line-add-newlines nil)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t nil (paren)))

(setq ps-font-size 8)
(defun my-ps-print-buffer()
	(interactive)
	(message "  print ... ")
	(setq filename "~/tmp/1.ps")
	(ps-print-buffer-with-faces filename))

(global-set-key "\M-\C-p" 'my-ps-print-buffer)
(global-set-key "\C-g" 'goto-line)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray11" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 156 :width normal :foundry "unknown" :family "DejaVu Sans")))))

(customize-set-variable 'scroll-bar-mode 'right)

(setq inhibit-startup-message t)

(setq gnus-inhibit-startup-message t)

(setq scroll-margin 3 scroll-conservatively 10000)

(defun open-eshell-other-buffer ()
"Open eshell in other buffer"
(interactive)
(split-window-vertically)
(eshell))
(defun kill-shell ()
"Kill shell"
(interactive)
(kill-buffer-and-window))
(global-set-key [(f8)] 'open-eshell-other-buffer)
(global-set-key [C-f8] 'eshell)
(global-set-key [(f9)] 'kill-shell)

;; Load CEDET
(load-file "/home/ykli/.emacs.d/cedet/common/cedet.el")
;(global-ede-mode 1)
;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;; Select one of the following:

;; * This enables the database and idle reparse engines
;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as the nascent intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;;(semantic-load-enable-guady-code-helpers)

;; * This turns on which-func support (Plus all other code helpers)
;;(semantic-load-enable-excessive-code-helpers)

;; This turns on modes that aid in grammar writing and semantic tool
;; development.  It does not enable any other features such as code
;; helpers above.
(semantic-load-enable-semantic-debugging-helpers)

;;; gcc setup
;(require 'semantic-gcc)

;;; smart complitions setup
(require 'semantic-ia)


;(add-to-list 'load-path "~/.emacs.d/ecb-2.40")
(add-to-list 'load-path "~/.emacs.d/ecb-snap")
;;eg(add-to-list 'load-path "~/.emacs.d/ecb-2.32")
(require 'ecb)

(set-default-font "Mono-14")
(add-to-list 'default-frame-alist '(font . "Mono-14"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  semantic
(require 'cc-mode)
;(define-key c-mode-base-map (kbd "\C-tab") 'semantic-ia-complete-symbol-menu)
(define-key c-mode-base-map [(control tab)] 'semantic-ia-complete-symbol-menu)
(define-key c-mode-base-map [(f7)] 'semantic-ia-fast-jump)
(define-key c-mode-base-map [(S-f7)] 'semantic-mrub-switch-tags)
;(define-key c-mode-base-map [(control tab)] 'ac-complete-semantic-raw)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ecb

;(setq ecb-auto-activate t)
(setq ecb-tip-of-the-day nil)
(ecb-activate)
(ecb-hide-ecb-windows)

(global-set-key [M-left] 'windmove-left)

(global-set-key [M-right] 'windmove-right)

(global-set-key [M-up] 'windmove-up)

(global-set-key [M-down] 'windmove-down) 

(define-key global-map [f5] 'ecb-show-ecb-windows)
(define-key global-map [f6] 'ecb-hide-ecb-windows)


;(define-key global-map "/C-c1" 'ecb-maximize-window-directories)

;(define-key global-map "/C-c2" 'ecb-maximize-window-sources)

;(define-key global-map "/C-c3" 'ecb-maximize-window-methods)

;(define-key global-map "/C-c4" 'ecb-maximize-window-history)

;(define-key global-map "/C-c`" 'ecb-restore-default-window-sizes)
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ecb layout
(ecb-layout-define "ykli-ecb-layout" right nil  
                   (ecb-set-directories-buffer)
                   (ecb-split-ver 0.3 t)  
                   (other-window 1)  
                   (ecb-set-sources-buffer)  
                   (ecb-split-ver 0.3 t)  
                   (other-window 1)  
                   (ecb-set-methods-buffer))  
  
(setq ecb-layout-name "ykli-ecb-layout")  
  
;; Disable buckets so that history buffer can display more entries  
;(setq ecb-history-make-buckets 'never)  


;(add-to-list 'load-path "/home/ykli/.emacs.d/auto-complete-1.3.1")
;(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "/home/ykli/.emacs.d/ac-dict")

;(ac-config-default)
;(setq-default ac-sources '(ac-source-semantic ac-source-semantic-raw ac-source-yasnippet))
;(ac-cc-mode-setup)

;(require 'auto-complete-semantic nil t)
;(setq-default ac-sources '(ac-source-semantic))   
(setq semantic-edits-verbose-flag nil)

(server-start)
