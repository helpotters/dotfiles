(setq
        user-full-name "Paul Lemus"
        user-mail-address "paullemusprotonmail.com")

(setq-default
 delete-by-moving-to-trash t
 x-stretch-cursor t
 uniquify-buffer-name-style 'forward
 tab-width 4)
(setq
 undo-limit 100000000
 evil-want-fine-undo t
 auto-save-default t
 ;; truncate-string-ellipsis "…"
 )

(unless (equal "Battery status not available"
               (battery))
  (display-battery-mode 1))

(defun doom-modeline-conditional-buffer-encoding ()
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))
(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)



(setq  doom-font (font-spec :family "Fira Code" :size 18)
       doom-big-font (font-spec :family "Fira Code" :size 36))

;; (setq display-line-numbers-type 'relative)

(setq org-base (expand-file-name "~/Dropbox/org/"))
(setq org-slip-box (expand-file-name (concat org-base "slip-box/")))
(setq org-papers (expand-file-name (concat org-base "papers/")))

(setq org-directory org-base)

(setq org-hide-emphasis-markers t)

(after! org-mode
  (setq
   org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
   ))

(use-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                   :time-grid t
                                   :scheduled today)
                                   (:name "Projects"
                                   :tags project)
                                   (:name "Important"
                                    :priority>= B)
                                   (:name "Past Due"
                                    :scheduled past)))
  :config
  (org-super-agenda-mode))

(use-package! org-ref
  :after org-mode
  :config
  (setq
   org-ref-default-bibliography (list (concat org-papers "master.bib"))
   org-ref-notes-directory org-papers
   org-ref-bibliography-notes (concat org-papers "master.org")
   org-ref-completion-library 'org-ref-ivy-cite-completion
   ;; org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
   org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex
   org-ref-notes-function 'orb-edit-notes
   ))

(after! org-ref
  :config
  (setq
   bibtex-completion-bibliography (concat org-base "papers/master.bib")
   bibtex-completion-pdf-field "file"
   bibtex-completion-notes-path (concat org-base "papers/")
   ;; bibtex-completion-notes-template-multiple-files
   ;; (concat
   ;;  "#+TITLE: ${title}\n"
   ;;  "#+ROAM_KEY: cite:${=key=}\n"
   ;;  "* TODO Notes\n"
   ;;  ":PROPERTIES:\n"
   ;;  ":Custom_ID: ${=key=}\n"
   ;;  ":NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n"
   ;;  ":AUTHOR: ${author-abbrev}\n"
   ;;  ":JOURNAL: ${journaltitle}\n"
   ;;  ":DATE: ${date}\n"
   ;;  ":YEAR: ${year}\n"
   ;;  ":DOI: ${doi}\n"
   ;;  ":URL: ${url}\n"
   ;;  ":END:\n\n"
   ;;  )

   )
  )

(use-package! org-noter
  :after (:any org pdf-view)
  :config
  (setq
   midnight-mode t))

(setq
 org-journal-dir (concat org-base "journal/")
 org-journal-date-prefix "#+TITLE: "
 org-journal-time-prefix "* "
 org-journal-date-format "%a, %Y-%m-%d"
 org-journalfile-format "%Y-%m-%d.org")

        (setq org-roam-directory org-slip-box)
        (setq org-roam-db-location org-slip-box)

(use-package! org-roam-bibtex
  :load-path "~/Dropbox/org/papers/master.bib" ;Modify with your own path
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :bind (:map org-mode-map
         (("C-c n a" . orb-note-actions))))
(setq orb-templates
      '(("r" "ref" plain (function org-roam-capture--get-point) ""
         :file-name "${citekey}"
         :head "#+TITLE: ${citekey}: ${title}\n#+ROAM_KEY: ${ref}\n" ; <--
         :unnarrowed t)))
(setq orb-preformat-keywords   '(("citekey" . "=key=") "title" "url" "file" "author-or-editor" "keywords"))

(setq orb-templates
      '(("n" "ref+noter" plain (function org-roam-capture--get-point)
         ""
         :file-name "${slug}"
         :head "#+TITLE: ${citekey}: ${title}\n#+ROAM_KEY: ${ref}\n#+ROAM_TAGS:

- tags ::
- keywords :: ${keywords}
\* ${title}
:PROPERTIES:
:Custom_ID: ${citekey}
:URL: ${url}
:AUTHOR: ${author-or-editor}
:NOTER_DOCUMENT: %(orb-process-file-field \"${citekey}\")
:NOTER_PAGE:
:END:")))

(use-package! org-roam-server
  :after org-roam
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-export-inline-images t
        org-roam-server-authenticate nil
        org-roam-server-label-truncate t
        org-roam-server-label-truncate-length 60
        org-roam-server-label-wrap-length 20)
  (defun org-roam-server-open ()
    "Ensure the server is active, then open the roam graph."
    (interactive)
    (org-roam-server-mode 1)
    (browse-url-xdg-open (format "http://localhost:%d" org-roam-server-port))))
(after! org-roam
  (org-roam-server-mode))
