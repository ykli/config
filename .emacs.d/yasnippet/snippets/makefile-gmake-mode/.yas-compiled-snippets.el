;;; Compiled snippets and support files for `makefile-gmake-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'makefile-gmake-mode
		     '(("ps" "$(patsubst ${1:from},${2:to},${3:src})" "patsubst" nil nil nil nil nil nil)
		       ("ph" ".PHONY = $0" "phony" nil nil nil nil nil nil)
		       ("wl" "$(wildcard $0)" "wildcard" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Tue Oct 21 19:11:22 2014
