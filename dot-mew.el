;; ------------------------------------------------;;
;;  __  ____   __  __  __   _   ___ _
;; |  \/  \ \ / / |  \/  | /_\ |_ _| |
;; | |\/| |\ V /  | |\/| |/ _ \ | || |__
;; |_|  |_| |_|   |_|  |_/_/ \_\___|____|

;; shameless copied from:
;; http://cermics.enpc.fr/~lelong/Emacs/dotmewdotel.html
;; ------------------------------------------------;;


;; ------------------------------------------------;;
;; mail accounts
(setq mew-config-alist
      ;; GMAIL IMAP
      '(
        ("default"
         ("mailbox-type". imap)
         ("proto"          . "%")
         ("name"           . "Nagi")
         ("user"           . "USERNAME@googlemail.com")  ;; to be completed
         ("imap-server"    . "localhost")
         ("imap-delete" . t)
         ("imap-size" . 0)
         ("imap-ssl"       . t)
         ("imap-user"      . "USERNAME@googlemail.com")  ;; to be completed
         ("imap-ssl-port"  . "9930")
         ("fcc" . "%Sent")
         ("cc" . "")
         ("imap-trash-folder" . "%Trash")
         ;; SMTP
         ("smtp-ssl"       . t)
         ("smtp-ssl-port"  .  "4650")
         ("smtp-auth-list" . ("PLAIN" "LOGIN" "CRAM-MD5"))
         ("smtp-user"      . "USERNAME@googlemail.com")   ;; to be completed
         ("smtp-server"    . "localhost")
         ("mail-domain"    . "localhost")
         )
        ("local"
         ("mailbox-type" . mbox)
         ("proto" . "+")
         ("name" . " ")                                      ;; to be completed
         ("mbox-command-arg" . "-c -u -d /var/mail/USERNAME") ;; to be completed
         ("inbox-folder" . "+system")
         )
        )
      )
;; ------------------------------------------------;;



;; ------------------------------------------------;;
;; general config for all accounts

(setq mew-smtp-ssl-port "4650")  ;; change it for your
;;(setq mew-prog-ssl "/opt/local/bin/stunnel")
(setq mew-ssl-verify-level 0)
(setq mew-pop-auth 'pass) 
(setq mew-pop-size 0)
;;(setq mew-smtp-port "25")
(setq mew-mbox-command "incm")
(setq mew-auto-flush-queue t)
(setq mew-decode-broken t)
(setq mew-summary-form-mark-spam t)
(set-default 'mew-decode-quoted 't)

(setq mew-pop-delete t)
(setq mew-ssl-verify-level 0)
;; ------------------------------------------------;;



;; ------------------------------------------------;;
;; Gnupg
;; (setq mew-protect-privacy-always t)
;; (setq mew-protect-privacy-always-type 'pgp-signature)
(setq mew-use-pgp-cached-passphrase t)
;; (setq mew-pgp-server-url-template "http://pgp.mit.edu:11371/pks/lookup?op=get&search=0x4BB3C992")
;; ------------------------------------------------;;



;; ------------------------------------------------;;
;; default paths
(setq mew-mail-path "~/.Mail-Mew")
(setq mew-conf-path mew-mail-path)
(setq mew-addrbook-file "~/dotfiles/.Addressbook")
;; ------------------------------------------------;;


;; ----------------------------------------------- ;;
;; Password
(setq mew-use-cached-passwd t)     ;; nil
(setq mew-passwd-timer-unit 1)     ;; 10 (minutes)
(setq mew-passwd-lifetime 300000)  ;; 2
;; ----------------------------------------------- ;;


;; ----------------------------------------------- ;;
;; Printing mail
;;(setq mew-field-for-printing '("Subject:" "From:" "To:" "Cc:" "Date:"))
;;(setq mew-print-function 'ps-print-buffer)
;; ----------------------------------------------- ;;


