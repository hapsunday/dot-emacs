;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defconst zhk-top-dir (file-name-directory load-file-name)
  "the directory of configurations")

(defconst zhk-home-dir (getenv "HOME") "home directory")

(defconst zhk-use-auctex t "load auctex or not.")

;; Load up Org Mode and Babel
(require 'org-install)
(require 'ob-tangle)
;; load up the main file
(org-babel-load-file (expand-file-name "zhk-emacs.org" zhk-top-dir))
