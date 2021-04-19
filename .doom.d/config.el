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
(setq
 ;; golden-ratio-mode t
 ;; golden-ratio-auto-scale t
 ;; golden-ratio-wide-adjust-factor 8.8
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
(global-set-key (kbd "<f6>") 'org-capture) ;; open up templates
(global-set-key (kbd "<f7>") 'org-columns) ;; toggle org buffer columns
(global-set-key (kbd "<f8>") 'org-agenda-columns) ;; toggle agenda columns
(global-set-key (kbd "<f5>") (lambda () (interactive) (find-file (concat org-base "projects/personal/personal.org")))) ;; open main life management file
(global-set-key (kbd "<menu>") (lambda () (interactive) (find-file (concat org-base "projects/personal/education.org")))) ;; open main life management file

(setq fancy-splash-image "~/.doom.d/black-hole.png")

(setq doom-theme 'doom-dracula)

(setq  doom-font (font-spec :family "JetBrains Mono" :size 18)
       doom-big-font (font-spec :family "JetBrains Mono" :size 36))

(setq display-line-numbers-type 'relative)

(setq org-base (expand-file-name "~/Dropbox/org/"))
(setq org-papers (expand-file-name (concat org-base "papers/")))
(setq org-directory org-base)

(setq org-hide-emphasis-markers t)

(after! org
  (setq
   org-todo-keywords '((sequence
                        "REPEAT(r)"
                        "NEXT(n)" ;; next task
                        "TODO(t@)" ;; A task
                        "PROG(g@)" ;; IN progress
                        "WAITING(w@)"
                        "PROJ(p@)"
                        "|"
                        "DONE(d)"
                        "CANCELED(c!)"
                        ))
   )
  )

(after! org-fancy-priorities
  (setq
   org-highest-priority ?A ;; urgent and important
   org-default-priority ?B ;; urgent but not important
   ;; C important but not urgent
   org-lowest-priority ?D ;; not urgent and not important
   org-fancy-priorities-list '("", "", "", "")
   )
  )

(setq enable-local-eval t)
(setq safe-local-eval-forms '((progn (org-agenda-list) (other-window 1))))
(setq org-log-into-drawer t)

(add-to-list 'org-modules 'org-habit)

;; (setq
;;  org-habit-completed-glyph 244
;;  org-habit-today-glyph 32

;;  )

(after! org
  (setq
   org-agenda-start-day "0d" ;; View my agenda TODAY as the first item
   org-agenda-skip-scheduled-if-done t
   org-agenda-skip-deadline-if-done t
   org-agenda-skip-timestamp-if-done t
   org-agenda-current-time-string " Now "
   ;; org-agenda-breadcrumbs-separator ""
   org-agenda-block-separator '""
   org-agenda-span 1
   ;; org-agenda-compact-blocks t
   )
  )

(use-package! org-super-agenda
  :defer t
  :after org-agenda
  :init
  (setq org-agenda-custom-commands
        '( ;; all container
          ("c" "Concise Day View"
           (;; view container
            (alltodo "REPEAT" ((org-agenda-overriding-header "")
                               (org-agenda-remove-tags)
                               (org-agenda-prefix-format "  %i %?-2 t%s")
                               (org-super-agenda-groups
                                '((:name " Habits"
                                   :discard (:not (:habit t))
                                   :scheduled today
                                   :order 1)
                                  (:discard (:anything)))
                                ))

                     )

            (agenda "" ((org-agenda-overriding-header "") ;;(org-agenda-remove-tags)
                        (org-agenda-prefix-format
                         '(
                           ;; (tags . " %i %-12:c%?-12t% s") ;; file name + org-agenda-entry-type
                           (agenda  . "  %?-12t% i")
                           ;; (timeline  . " %?-12e")
                           ;; (todo  . " %?-12e ")
                           (tags  . " %?-12i")
                           ;; (search . " %i %-12:c")
                           ))
                        (org-agenda-time-grid '((today)(600 800 1000 1200 1400 1600 1800 2000) "   " ""))
                        (org-super-agenda-groups
                         '((:name " Daily Studies "
                            :discard (:deadline future)
                            :tag "study"
                            :order 3
                            )
                           (:name " Today's Schedule "
                            :discard (:property "STYLE")
                            :discard(:tag "study")
                            :time-grid t
                            :date today
                            :scheduled today
                            :order 2
                            :discard(:anything)
                            )

                           (:discard(:anything)))
                         ))
                    )

            (alltodo "" ((org-agenda-overriding-header "") ;;(org-agenda-remove-tags)
                         (org-agenda-scheduled-leaders '("" "          "))
                         (org-agenda-prefix-format " %i %?-2 t%s")
                         ;; (org-agenda-time-grid '((today)(800 1000 1200 1400 1600 1800 2000) "   " ""))
                         (org-super-agenda-groups
                          '(
                            (:name " Missed "
                             :scheduled past
                             :date today
                             :order 1
                             )
                            (:discard (:anything))
                            ))
                         )
                     );; container end
            );;view container end
           );; concise view container end

          ("p" "Night Planning View"
           (;; view container
            (agenda "" ((org-agenda-overriding-header "Plan ahead. ") ;;(org-agenda-remove-tags)
                        ;; (org-agenda-scheduled-leaders '( '(defun org-agenda-get-category-icon) "          "))
                        ;; (org-agenda-prefix-format " %i %?-2 t%s")
                        (org-agenda-prefix-format
                         '(
                           ;; (tags . " %i %-12:c%?-12t% s") ;; file name + org-agenda-entry-type
                           (agenda  . "   %?-12t% s")
                           ;; (timeline  . " %?-i % s")
                           ;; (todo  . " %c")
                           ;; (tags  . " %i %-12:c")
                           ;; (search . " %i %-12:c")
                           ))
                        (org-agenda-time-grid '((weekly)(600 800 1000 1200 1400 1600 1800 2000) "   " ""))
                        (org-agenda-span 2)
                        (org-agenda-start-day "+1d")
                        (org-super-agenda-groups
                         '((:name " Tomorrow and Day After"
                            :time-grid t
                            :order 1
                            )
                           )
                         ))
                    )
            (alltodo "" ((org-agenda-overriding-header "")
                         (org-agenda-remove-tags)
                         (org-agenda-prefix-format "  %i %?-2 t%s")
                         (org-super-agenda-groups
                          '(
                            (:name "  Deadlines Approaching "
                             :deadline future
                             :order 1
                             )
                            (:discard(:anything))
                            )))
                     )



            (alltodo "" ((org-agenda-overriding-header "") ;;(org-agenda-remove-tags)
                         (org-agenda-scheduled-leaders '("" "          "))
                         (org-agenda-prefix-format " %i %?-2 t%s")
                         ;; (org-agenda-time-grid '((today)(800 1000 1200 1400 1600 1800 2000) "   " ""))
                         (org-super-agenda-groups
                          '((:auto-parent t))
                          ))
                     )
            );;view container end
           );;nightly end
          ("e" "Tomes & Learning"
           (
            (alltodo "NEXT" ((org-agenda-overriding-header " Academic Summary ")
                             (org-agenda-remove-tags)
                             (org-agenda-prefix-format "  %i %?-2 t%s")
                             (org-super-agenda-groups
                              '((:log t)
                                (:name " Readings "
                                 :and (:tag "reading" :todo "NEXT")
                                 :order 1)
                                (:name " Assignments"
                                 :tag "homework"
                                 :order 2)
                                (:discard (:anything))
                                )
                              )))


            (alltodo "NEXT" ((org-agenda-overriding-header "Important Dates")
                             (org-super-agenda-groups

                              '((:name "Exams "
                                 :and (:todo "NEXT" :tag "exam")
                                 :order 3)
                                (:discard (:anything))))
                             )
                     )
            ) ;; container end
           );;tomes end
          ("d" "Daily Glance"
           (
            (alltodo "" ((org-agenda-overriding-header "")
                         (org-super-agenda-groups
                          '((:log t)
                            (:name " UPCOMING "
                             :todo "NEXT"
                             :date today
                             :order 1
                             :discard (:anything))
                            (:name "Project Actions "
                             :todo "PROJ"
                             :discard (:not (:todo "NEXT"))
                             )
                            (:auto-group t)
                            )

                          )))


            (agenda "" ((org-agenda-overriding-header "")
                        (org-super-agenda-groups
                         '((:name " Today's Schedule "
                            :time-grid t
                            :date today
                            :order 3)
                           (:discard (:anything))))
                        )
                    )
            ) ;; container end
           ) ;; daily glance container end
          ("w" "Weekly Overview"
           (
            (agenda "" ((org-agenda-overriding-header " Here's Your Week ")
                        (org-agenda-remove-tags)
                        (org-agenda-span 7)
                        (org-agenda-prefix-format
                         '(
                           ;; (tags . " %i %-12:c%?-12t% s") ;; file name + org-agenda-entry-type
                           (agenda  . "  %?-12t% s")
                           (timeline  . " %?-i % s")
                           ;; (todo  . " %c")
                           ;; (tags  . " %i %-12:c")
                           ;; (search . " %i %-12:c")
                           ))
                        (org-agenda-start-day "-1d")
                        (org-super-agenda-groups
                         '((:log t)
                           (:name " "
                            :scheduled future
                            :todo "TODO"
                            :order 1
                            :discard (:todo "REPEAT"))
                           ;; (:name " Assignments"
                           ;;  :children t
                           ;;  :auto-parent 't
                           ;;  :order 2)
                           ;; (:discard (:anything))
                           )
                         )))


            ;; (agenda "" ((org-agenda-overriding-header "Important Dates")
            ;;             (org-super-agenda-groups
            ;;              '((:name "Exams "

            ;;                 :time-grid t
            ;;                 :order 3)
            ;;                (:discard (:anything))))
            ;;             )
            ;;         )
            ) ;; container end
           ) ;; week container end
          ("q" "Quarter Overview"
           (
            (agenda "" ((org-agenda-overriding-header " Quarterly Overview")
                        (org-agenda-remove-tags)
                        (org-agenda-show-all-dates nil)
                        (org-agenda-entry-types '(:deadline))
                        (org-agenda-span 100) ;; 14 weeks
                        (org-agenda-prefix-format
                         '(
                           ;; (tags . " %i %-12:c%?-12t% s") ;; file name + org-agenda-entry-type
                           (agenda  . "  %?-12t% s")
                           ;; (timeline  . " %?-i % s")
                           ;; (todo  . " %c")
                           (tags  . " %i %-12:c")
                           ;; (search . " %i %-12:c")
                           ))
                        (org-agenda-start-day "-1d")
                        (org-super-agenda-groups
                         '((:log t)
                           (:name " "
                            :time-grid nil
                            :deadline future
                            :discard (:not (:deadline future))
                            :order 1)
                           )
                         )))

            ) ;; container end
           );; quarter view
          );; all views container end
        );; setq container end


  :config
  (org-super-agenda-mode)
  ) ;; use package end

(after! org-agenda
  (org-super-agenda-mode))

;; (after! org
;;   (setq
;;    org-agenda-category-icon-alist `(
;;                                     ;; ("web dev" "~/Dropbox/Apps/png/web-dev.png" nil nil ((:width 36) (:height 36) (:aspect center))  )
;;                                     ;; ("education" "~/Dropbox/App/png/education.png" (:width 36) (:height 36) :aspect center)
;;                                     ;; ("lifting" "~/Dropbox/App/png/lifting.png" (:width 36) (:height 36) :aspect center )
;;                                     ;; ("health" "~/Dropbox/App/png/health.png")
;;                                     ("dnd" "~/Dropbox/App/png/dnd.png" nil nil :aspect center)
;;                                     ("linux" "~/Dropbox/App/png/linux.png")
;;                                     ("emacs" "~/Dropbox/App/png/emacs.png")
;;                                     )
;;    )
(after! org (setq org-agenda-category-icon-alist '(
                                                   ;; Education Cats
                                                   ("uni" "~/Dropbox/Apps/png/school.png" nil nil :ascent center)
                                                   ("reading" "~/Dropbox/Apps/png/chemistry-1.png" nil nil :ascent center)
                                                   ("homework" "~/Dropbox/Apps/png/chemistry.png" nil nil :ascent center)
                                                   ;; Interpersonal
                                                   ("meeting" "~/Dropbox/Apps/png/contacts.png" nil nil :ascent center)
                                                   ("zoom" "~/Dropbox/Apps/png/videoconference.png" nil nil :ascent center)
                                                   ("dnd" "~/Dropbox/Apps/png/icosahedron.png" nil nil :ascent center)
                                                   ;; Finances
                                                   ("real-estate" "~/Dropbox/Apps/png/eco-house.png" nil nil :ascent center)
                                                   ("investing" "~/Dropbox/Apps/png/accruals.png" nil nil :ascent center)
                                                   ("work" "~/Dropbox/Apps/png/work.png" nil nil :ascent center)
                                                   ;; Computers
                                                   ("linux" "~/Dropbox/Apps/png/linux.png" nil nil :ascent center) ;; computer maintence
                                                   ("emacs" "~/Dropbox/Apps/png/emacs.png" nil nil :ascent center) ;; emacs maintenence
                                                   ("web dev" "~/Dropbox/Apps/png/web-design.png" nil nil :ascent center)
                                                   ;; Health
                                                   ("exercise" "~/Dropbox/Apps/png/barbell.png" nil nil :ascent center)
                                                   ("health" "~/Dropbox/Apps/png/heart-1.png" nil nil :ascent center)
                                                   ("brain" "~/Dropbox/Apps/png/brain.png" nil nil :ascent center)
                                                   ;; Planning
                                                   ("plan" "~/Dropbox/Apps/png/filter-1.png" nil nil :ascent center)
                                                   )))

(after! org
  (setq
   +org-capture-notes-file "captures/notes.org"
   +org-capture-todo-file "captures/todo.org"
   ;; Templates
   )
  )

(after! org-ref
  :config
  (setq org-ref-default-bibliography (list (concat org-papers "master.bib")))
  (setq org-ref-pdf-directory (concat org-papers "zotero/storage/"))
  (setq org-ref-notes-directory org-papers)
  (setq org-ref-bibliography-notes (concat org-papers "master.org"))
  (setq org-ref-completion-library 'org-ref-ivy-cite-completion)
  (setq org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex)
  )

(after! ivy-bibtex
  :config
  (setq
   bibtex-completion-bibliography (concat org-base "papers/master.bib")
   bibtex-completion-pdf-field "file"
   bibtex-completion-library-path (concat org-papers "zotero/storage/")
   bibtex-completion-notes-path (concat org-base "papers/")
   )
  )

(use-package! org-noter
  :defer t
  :after (:any org pdf-view)
  :config
  (setq
   pdf-view-midnight-minor-mode t))

(use-package! org-journal
  :defer t
  :after org
  :config
  (setq
   org-journal-dir (concat org-base "journal/")
   org-journal-date-prefix "#+TITLE: "
   org-journal-time-prefix "* "
   org-journal-date-format "%a, %Y-%m-%d"
   org-journal-file-format "%Y-%m-%d.org")
  )

(use-package! org-roam-server
  :defer t
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
