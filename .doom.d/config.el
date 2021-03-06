;;; config.el -*- lexical-binding: t; -*-
(setq
        user-full-name "Paul Lemus"
        user-mail-address "paullemusprotonmail.com")

(setq-default
    delete-by-moving-to-trash t
    x-stretch-cursor t
    uniquify-buffer-name-style 'forward
    tab-width 4
)
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



    (global-set-key (kbd "<f12>") 'org-agenda) ;; WHAT DO I DO ??
    (global-set-key (kbd "<f9>") 'ivy-bibtex) ;; open up references
    (global-set-key (kbd "<f5>") (lambda () (interactive) (find-file (concat org-base "projects/personal/personal.org")))) ;; open main life management file



(setq  doom-font (font-spec :family "JetBrains Mono" :size 18)
       doom-big-font (font-spec :family "JetBrains Mono" :size 36))

(setq display-line-numbers-type 'relative)

(setq org-base (expand-file-name "~/Dropbox/org/"))
(setq org-slip-box (expand-file-name (concat org-base "roam/")))
(setq org-papers (expand-file-name (concat org-base "papers/")))

(setq org-directory org-base)

(setq org-hide-emphasis-markers t)

(after! org
  (setq
        org-todo-keywords '((sequence
                             "REPEAT(r)"
                             "NEXT(n)" ;; next task
                             "TODO(t)" ;; A task
                             "WAITING(w)"
                             "PROJ(p)"
                             "|"
                             "DONE(d)"
                             "CANCELED(c)"
                           ))
    )
)

(setq enable-local-eval t)
(setq safe-local-eval-forms '((progn (org-agenda-list) (other-window 1))))
(setq org-log-into-drawer t)

(add-to-list 'org-modules 'org-habit)

(after! org
  (setq
        org-agenda-start-day "0d" ;; View my agenda TODAY as the first item
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-span 1
        org-agenda-compact-blocks t
  )
)



(setq org-ref-default-bibliography (list (concat org-papers "master.bib")))
(setq org-ref-pdf-directory (concat org-papers "zotero/storage/"))
(setq org-ref-notes-directory org-papers)
(setq org-ref-bibliography-notes (concat org-papers "master.org"))
(setq org-ref-completion-library 'org-ref-ivy-cite-completion)
(setq org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-ivy-bibtex)
(setq org-ref-notes-function 'orb-edit-notes)

(use-package! ivy-bibtex
  :after org
  :config
)
(setq
 bibtex-completion-bibliography (concat org-base "papers/master.bib")
 bibtex-completion-pdf-field "file"
 bibtex-completion-library-path (concat org-papers "zotero/storage/")
 bibtex-completion-notes-path (concat org-base "papers/")
 )

(use-package! org-noter
  :after (:any org pdf-view)
  :config
  (setq
   midnight-mode t))

(use-package! org-journal
  :after org
  :config
        (setq
        org-journal-dir (concat org-base "journal/")
        org-journal-date-prefix "#+TITLE: "
        org-journal-time-prefix "* "
        org-journal-date-format "%a, %Y-%m-%d"
        org-journalfile-format "%Y-%m-%d.org")
)

(use-package! org-roam
  :after org
  :init
  (setq org-roam-directory org-slip-box)
  )

;; (use-package! org-roam-bibtex
;;   :after org-roam
;;   :load-path "~/Dropbox/org/papers/master.bib" ;Modify with your own path
;;   :hook (org-roam-mode . org-roam-bibtex-mode)
;;   :bind (:map org-mode-map
;;          (("C-c n a" . orb-note-actions))))
;; (setq orb-templates
;;       '(("r" "ref" plain (function org-roam-capture--get-point) ""
;;          :file-name "${citekey}"
;;          :head "#+TITLE: ${citekey}: ${title}\n#+ROAM_KEY: ${ref}\n" ; <--
;;          :unnarrowed t)))
;; (setq orb-preformat-keywords   '(("citekey" . "=key=") "title" "url" "file" "author-or-editor" "keywords"))

;; (setq orb-templates
;;       '(("n" "ref+noter" plain (function org-roam-capture--get-point)
;;          ""
;;          :file-name "${slug}"
;;          :head "#+TITLE: ${citekey}: ${title}\n#+ROAM_KEY: ${ref}\n#+ROAM_TAGS:

;; - tags ::
;; - keywords :: ${keywords}
;; \* ${title}
;; :PROPERTIES:
;; :Custom_ID: ${citekey}
;; :URL: ${url}
;; :AUTHOR: ${author-or-editor}
;; :NOTER_DOCUMENT: %(orb-process-file-field \"${citekey}\")
;; :NOTER_PAGE:
;; :END:")))

(use-package! org-roam-server
  :after org-roam
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))
