;;  ___    __  __   _   ___ _
;; | __|__|  \/  | /_\ |_ _| |
;; | _|___| |\/| |/ _ \ | || |__
;; |___|  |_|  |_/_/ \_\___|____|
;;
;; Author: Nagi
;; Description: my email account settings
;;

;; mail accounts
(setq mew-config-alist
      ;; GMAIL IMAP
      '(
        ("default"
         ("mailbox-type". imap)
         ("proto"          . "%")
         ("name"           . "Nagi")
         ("user"           . "USERNAME@googlemail.com")
         ("imap-server"    . "localhost")
         ("imap-delete" . nil)
         ("imap-size" . 0)
         ("imap-ssl"       . t)
         ("imap-user"      . "USERNAME@googlemail.com")
         ("imap-ssl-port"  . "9930")
         ;; SMTP
         ("smtp-ssl"       . t)
         ("smtp-ssl-port"  .  "4650")
         ("smtp-auth-list" . ("PLAIN" "LOGIN" "CRAM-MD5"))
         ("smtp-user"      . "USERNAME@googlemail.com")
         ("smtp-server"    . "localhost")
         ("mail-domain"    . "localhost")
         ))
      )

;; general configuration for all account
(setq mew-smtp-ssl-port "4650")
;;(setq mew-prog-ssl "/usr/bin/stunnel")
;;(setq mew-smtp-port "25")
(setq mew-pop-size 0)
;;(setq toolbar-mail-reader 'Mew)
(setq mew-use-cached-passwd t)
(setq mew-passwd-timer-unit 999)
(setq mew-passwd-lifetime 999)
(set-default 'mew-decode-quoted 't)
(setq mew-pop-delete nil)
(setq mew-ssl-verify-level 0)

(setq mew-use-pgp-cached-passphrase t)
