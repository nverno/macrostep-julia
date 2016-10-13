(require 'ert)
(require 'macrostep)
(require 'macrostep-julia)
(require 'julia-mode)

(defmacro mj--should-expand (from to)
  `(with-temp-buffer
     (erase-buffer)
     (let ()
       (julia-mode)
       (insert ,from)
       (should (equal (buffer-substring-no-properties (point-min)
                                                      (point-max))
                      ,to)))))

(defun mj--run-tests ()
  (interactive)
  (if (featurep 'ert)
      (ert-run-tests-interactively "mj--test")
    (message "Can't run tests without ert.")))

(provide 'mj-tests)


;;; Local variables:
;;; eval: (local-set-key (kbd "C-c C-c") #'mj--run-tests)
;;; no-byte-compile: t
;;; End:
