(require 'js2-mode)

;; Add semicolon to end of line
(key-chord-define js2-mode-map ";;"  "\C-e;")

;; Expand and contract object
(define-key js2-mode-map (kbd "C-S-e") 'js-expand-object)
(define-key js2-mode-map (kbd "C-S-c") 'js-contract-object)

;; js2-mode steals TAB, let's steal it back for yasnippet
(define-key js2-mode-map (kbd "TAB") (lambda()
                                            (interactive)
                                            (let ((yas/fallback-behavior 'return-nil))
                                              (unless (yas/expand)
                                                (indent-for-tab-command)
                                                (if (looking-back "^\s*")
                                                    (back-to-indentation))))))

(provide 'js2-mode-expansions)