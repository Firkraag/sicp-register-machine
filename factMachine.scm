(load "simulator.scm")
(define fact-machine
  (make-machine
    '(counter product n)
    (list (list '> >) (list '+ +) (list '* *))
    '((assign counter (const 1))
      (assign product (const 1))
      test-counter (test (op >) (reg counter) (reg n))
                    (branch (label fact-done))
                    (assign product (op *) (reg product) (reg counter))
                    (assign counter (op +) (reg counter) (const 1))
                    (goto (label test-counter))
                    fact-done)))
(set-register-contents! fact-machine 'n 12)
(start fact-machine)
(get-register-contents fact-machine 'product)

