;; Hi, welcome to your personal configuration!
;; Here you can organize your configurations the way you want.
;; Just read the comments before change anything.
;; Quick Tip: To comment / uncomment, just press gcc on normal mode or gc on visual mode.

;; MOST IMPORTANT CONFIG - Set your project folders
(setq projectile-project-search-path '("~/Projetos" "~/Study"))

;; To test a new font, press M-x (alt + x) and search for reload-user-settings
;; My recommendation is JetBrains Mono
;; (setq doom-font (font-spec :family "JetBrains Mono" :size 16 :weight 'regular) ;; You can change to regular if you prefer
;;       doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 15))

;; Theme
;; You can see all the themes here: https://github.com/hlissner/emacs-doom-themes/tree/screenshots
(setq doom-theme 'doom-one)

;; Set your username
(setq user-full-name "Otávio Schwanck dos Santos"
      user-mail-address "otavioschwanck@gmail.com")

;; TERMINAL MANAGEMENT STUFF ;;
;; Predefined commands
;; You can switch to any terminal with SPC l
;; You can search the commands with SPC o t
;; You can send any text to any terminal by selecting and pressing SPC l
;; You can quickly execute a define command with SPC j + the keybinding you defined.
;;
(after! which-key
  ;;                         | Name              | command                      | Keybinding |
  (+add-command-to-term-list '("Docker Compose" . "docker-compose up") "u") ;; SPC j u

  ;; Example asking something
  (+add-command-to-term-list '("Add Yarn Package" . (concat "yarn add " (read-string "Package name: "))) "ya") ;; SPC j y a

  ;; Example of dynamic command (using buffer name as example)
  (+add-command-to-term-list '("Rspec on file" . (concat "bundle exec rspec " (buffer-file-name))) "sv") ;; SPC j s v
  (+add-command-to-term-list '("Rspec on line" . (concat "bundle exec rspec " (buffer-file-name) ":" (format "%s" (line-number-at-pos)))) "ss") ;; SPC j s s

  ;; Getting text and executing a command
  (+add-command-to-term-list '("Brownie Test" . (concat "brownie test -k " (save-excursion (search-backward "def test_") (forward-word 2) (thing-at-point 'symbol t)))) "bt") ;; SPC j b t

  ;; Running scripts of a specific folder
  (+add-command-to-term-list '("Brownie Run Script" . (concat "brownie run " (read-file-name "scripts/") " " (read-string "Extra parameters: " nil "commands"))) "br") ;; SPC j b r

  ;; Creating terminal layouts: SPC T
  ;; It will create a new workspace with all terminals listed
  ;;                         | Layout Name    | Commands to execute                |
  (+add-layout-to-term-list '("Rails" . '("rails console" "rails server" nil)))
  (+add-layout-to-term-list '("React" . '("yarn start" nil)))
  (+add-layout-to-term-list '("Next JS" . '("yarn dev" "cowsay 'Have an nice work'" nil))))


;; By default, the value of debugger is require 'pry'; binding.pry.  To change, uncomment and modify the variable below:
;; (setq debugger-command "byebug")
;; (setq pry-show-helper nil))

;; Google Tradutor, source and target languages
(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "pt")

;; Where is your fixtures?
(after! projectile-rails
  (setq projectile-rails-fixture-dirs '("spec/fixtures/" "spec/factories/")))

;; Want to use DOCKER?
;; First, configure you docker variables:

(setq ruby-docker-compose-command "docker-compose") ;; You docker-compose command (tip: you can use "cd ../; docker-compose")
(setq ruby-docker-rails-server-command "up") ;' To start rails server with SPC r R (docker-compose is implicit)
(setq ruby-docker-rails-console-command "run {{container}} rails console") ;; to start rails console (docker-compose is implicit)

(setq ruby-docker-rubocop-command "run {{container}} rubocop -a ") ;; Command to run rubocop on current file with SPC =
(setq ruby-docker-compose-cwd "/app/")
(setq ruby-docker-compose-container "web")

;; Tip here:  You can use M-x rbenv-use and select one version that has solargraph.  You can also install with apt or brew.
(setq ruby-docker-disable-solargraph nil) ;; If you want to disable solargraph, change to t.  PS:  You can use solargraph by removing .ruby-version of your project and using from rbenv.

;; To have always docker mode on, just uncomment:
;; (use-ruby-docker) ;; <<<<<<<< UNCOMMENT HERE TO USE DOCKER

;; You can also call M-x disable-ruby-docker to go back to ruby on machine.  You can call M-x use-ruby-docker whatever you want.

;; Ignoring some folders on search
(after! projectile
  (setq projectile-globally-ignored-directories '("flow-typed" "node_modules" "~/.emacs.d/.local/" ".idea" ".vscode" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" ".ccls-cache" ".cache" ".clangd")))


;; Directory of your org files
(setq org-directory "~/Dropbox/org/")


;; Ruby Linters
;; Commands to run before rubocop (checker)
;; (setq rubocop-append-command '("bundle" "exec"))

(setq rubocop-on-current-file-command "bundle exec rubocop -a ") ;; SPC =

;; Disable Rubocop or any other lint if you want.  Linter list on: SPC h v flycheck-checkers
;; (add-hook 'ruby-mode-hook
;;  (lambda ()
;;    (setq-local flychech-checker nil)
;;    (setq-local flycheck-disabled-checkers '(ruby-reek lsp ruby-rubylint ruby-rubocop))) 1000)


;; If you use macos with rbenv on homebrew, add it, uncomment it
;; (setq rbenv-executable "/usr/local/opt/rbenv/bin/rbenv") ;; Rosetta (intel emulation)
;; (setq rbenv-executable "/opt/homebrew/bin/rbenv") ;; Arm (normal installation)

;; Use different commands to rails server and console?
;; (setq projectile-rails-custom-server-command "your custom command")
;; (setq projectile-rails-custom-console-command "your custom command")

;; two or four spaces for identation?
(setq js-indent-level 2)
(setq ts-indent-level 2)
(setq typescript-indent-level 2)
(setq ruby-indent-level 2)
(setq standard-indent 2)

;; Mac improvement (cmd = meta)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'control)

;; Use sorbet instead solargraph?
;; (after! lsp-mode
;;   (setq lsp-disabled-clients '(ruby-ls solargraph))
;;   (setq lsp-sorbet-use-bundler t))


;; Use Minitest? Uncomment the code below: (V to select, gc to uncomment)
;; (after! ruby-mode ;; Beggining of minitest-code
;;   (defun goto-test ()
;;     (interactive)
;;     (find-file (file-path-to-test buffer-file-name)))
;;   (defun goto-test-and-vsplit ()
;;     (interactive)
;;     (if (string-match-p "/test/" buffer-file-name) (find-file (file-path-to-test buffer-file-name)))
;;     (delete-other-windows)
;;     (evil-window-vsplit)
;;     (if (string-match-p "/app/" buffer-file-name) (find-file (file-path-to-test buffer-file-name))))

;;   (defun file-path-to-test (filename)
;;     (if (string-match-p "/test/" filename)
;;         (if (string-match-p "/admin/" filename)
;;             (concat
;;              (replace-regexp-in-string "/test/controllers/" "/app/" (file-name-directory filename))
;;              (singularize-string (replace-regexp-in-string "_controller_test" "" (file-name-base filename)))
;;              "."
;;              (file-name-extension filename))
;;           (concat
;;            (replace-regexp-in-string "/test/" "/app/" (file-name-directory filename))
;;            (replace-regexp-in-string "_test" "" (file-name-base filename))
;;            "."
;;            (file-name-extension filename)))
;;       (if (string-match-p "/admin/" filename)
;;           (concat
;;            (replace-regexp-in-string "/app/" "/test/controllers/" (file-name-directory filename))
;;            (pluralize-string (file-name-base filename))
;;            "_controller_test."
;;            (file-name-extension filename))
;;         (concat
;;          (replace-regexp-in-string "/app/" "/test/" (file-name-directory filename))
;;          (file-name-base filename)
;;          "_test."
;;          (file-name-extension filename)))))

;;   (after! rspec-mode
;;     (map! :mode ruby-mode :leader "tv" #'minitest-verify)
;;     (map! :mode ruby-mode :leader "ts" #'minitest-verify-single)
;;     (map! :mode ruby-mode :leader "tr" #'minitest-rerun)
;;     (map! :mode ruby-mode :leader "ta" #'minitest-verify-all))

;;   ) ;; end of minitest-code
;;
;;
;; Tips: SPC a = switch between test file and real file with minitest and SPC A switch and vsplit


;;  Dictionary for spellcheck
;; sudo apt install aspell-pt-br or brew install aspell-pt-br
(setq ispell-dictionary "brasileiro")

;; Start projectile with magit, uncomment below:
;; (after! projectile
;;   (defun open-projectile-with-magit (&optional DIRECTORY CACHE)
;;     (interactive)
;;     (magit-status DIRECTORY)
;;     (if (fboundp 'magit-fetch-from-upstream)
;;         (call-interactively #'magit-fetch-from-upstream)
;;       (call-interactively #'magit-fetch-current)))
;;   (setq +workspaces-switch-project-function #'open-projectile-with-magit))

;; Build your own file switches
;; (after! projectile-rails
;;   ;; Example: switch from app/contracts/{resource}.rb to app/services/{resource} and vice-versa
;;   (defun projectile-rails-find-contract ()
;;     "Switch from contract to service and vice versa."
;;     (interactive)
;;     (if (string-match-p "app/contracts" (buffer-file-name)) (find-file (replace-regexp-in-string "contract" "service" (replace-regexp-in-string "_contracts" "_services" (buffer-file-name))))
;;       (find-file (replace-regexp-in-string "service" "contract" (replace-regexp-in-string "_services" "_contracts" (buffer-file-name))))))
;;   (map! :leader "rq" #'projectile-rails-find-contract)) ;; Uncomment to bind to SPC r q

;; Snippet describe
;; use descc snippet (with C-RET) on rspec to create describe '#call' ..
;; You can change the function uncommenting the code below and changing to your most used function
;; (setq ruby-rspec-describe-class "call")

;; Stop some boring warnings
(setq warning-minimum-level :emergency)


;; Add your custom config here:
