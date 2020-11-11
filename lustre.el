
;;; lustre.el  -  Major mode for editing lustre source in Emacs

;;; Copyright (C) 2001 Olivier Chevallier

;;; Auteur : Chevallier Olivier <p6mip467@infop6.jussieu.fr>
;;; Date   : 30 / 05 / 2001

;;; Modified by Alex Hubers (alexander-hubers@uiowa.edu) to just enforce syntax highlighting
;;; Date : 11 / 10 / 2020

;;; This file is not part of GNU Emacs

;;; This program is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 2 of the License, or
;;; (at your option) any later version.

;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.

;;; You should have received a copy of the GNU General Public License
;;; along with this program; if not, write to the Free Software
;;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; code :


(require 'font-lock)


;;; Hooks

(defvar lustre-mode-hook nil
  "functions called when entering Lustre Mode.")

;;; Key-map for Lustre-mode

(defvar lustre-mode-map nil
  "Keymap for lustre major mode.")


;;; Font-lock -----------------------------------------------------

(defvar lustre-font-lock-keywords nil
  "Regular expression used by Font-lock mode.")

(setq lustre-font-lock-keywords
      '(("--.*$" . font-lock-comment-face)
	("(\\*\\(.\\|\n\\)*?\\*)" . font-lock-comment-delimiter-face)
	("node *\\([a-zA-Z0-9_-]*\\) *(" 1 font-lock-function-name-face)
	("contract *\\([a-zA-Z0-9_-]*\\) *(" 1 font-lock-function-name-face)
        ("\\<\\(mode\\|const\\|contract\\|function\\|include\\|let\\|node\\|returns\\|tel\\|type\\|var\\)\\>" . font-lock-string-face)
        ("\\<\\(if\\|then\\|else\\)\\>[ \t\n]" 1 font-lock-keyword-face)
        ("\\<\\(true\\|and\\|or\\|not\\|false\\|xor\\)\\>" . font-lock-reference-face)
	("\\<\\(bool\\|int\\|real\\)\\(\\^[^ ;,)]+\\)?\\>" .
font-lock-variable-name-face)
	("\\(\\<\\(require\\|ensure\\|check\\|guarantee\\|assume\\|assert\\|pre\\)\\>\\|->\\)" .
font-lock-function-name-face)))


(defun lustre-font-mode ()
  "Initialisation of font-lock for Lustre mode."
  (make-local-variable 'font-lock-defaults)
  (setq font-lock-defaults
        '(lustre-font-lock-keywords t)))

; font-lock isn't used if in a  console
(if window-system
    (prog2
	(add-hook 'lustre-mode-hook
		  'turn-on-font-lock)
	(add-hook 'lustre-mode-hook
		  'lustre-font-mode)))

;;; Major-mode

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.lus$" . lustre-mode))

;;;###autoload
(defun lustre-mode ()
  "Major mode for editing Lustre files"

  (interactive)
  (kill-all-local-variables)
  (setq major-mode 'lustre-mode)
  (setq mode-name "Lustre")
  (run-hooks 'lustre-mode-hook))


(setq comment-start "-- ")
(setq comment-end "")

(provide 'lustre)

;;; lustre.el ends here...
