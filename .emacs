;; Mega Config File

;; If there is no el-get => install it

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(unless (file-exists-p "~/.emacs.d/el-get")
    (url-retrieve
     "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
     (lambda (s)
       (end-of-buffer)
       (eval-print-last-sexp)))
  )

(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

;; Add el-get path to the loadpath
(let ((default-directory "~/.emacs.d/el-get/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Load el-get
(require 'el-get)

;; Install required packages
(setq my:el-get-packages
      '(anaconda-mode
	jedi
	git-gutter
	yaml-mode
	apache-mode
	company-mode
	company-anaconda
	company-jedi
	csv-mode
	dockerfile-mode
	go-mode
	jinja2-mode
	json-mode
	js3-mode
	markdown-mode
	swift-mode
        yasnippet
        popup
	))
(el-get 'sync my:el-get-packages)

;; load packages
(require 'anaconda-mode)
(require 'jedi)
(require 'git-gutter)
(require 'yaml-mode)
(require 'apache-mode)
(require 'csv-mode)
(require 'dockerfile-mode)
(require 'go-mode)
(require 'jinja2-mode)
(require 'json-mode)
(require 'js3-mode)
(require 'markdown-mode)
(require 'php-mode)
(require 'swift-mode)
(require 'popup)
(require 'yasnippet)

;; Basic Settings
(show-paren-mode 1)
(global-git-gutter-mode +1)
(setq require-final-newline 'f)

(setq-default indent-tabs-mode nil)
;; Simple package names

;; Load hooks
(add-hook 'python-mode-hook 'jedi:setup)

;; Specify mappings for files
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.raml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.ino$" . c-mode))

;; Remove whitespaces before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Python
;; Setting default indent size
(setq python-indent-guess-indent-offset 4)

(add-hook 'php-mode-hook
          '(lambda()
             (setq indent-tabs-mode t)))

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
                        (setq js-indent-level 2)))


;; Auto Add (shabang)
(add-hook 'find-file-hooks
          '(lambda ()
             (auto-insert)
             ))

(setq auto-insert-alist
      '(
        ((python-mode . "Python Program")
         nil
         "#!/usr/bin/env python3\n"
         "# -*- coding: utf-8 -*-\n"
         "# Author: "(user-full-name) "\n#\n"
         )
        ))

;; Snippets
(add-to-list 'yas-snippet-dirs "~/.emacs.d/el-get/yasnippet/snippets/")
(yas-global-mode t)

;; add some shotcuts in popup menu mode
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

(defun yas/popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))

 (setq yas/prompt-functions '(yas/popup-isearch-prompt yas/no-prompt))
