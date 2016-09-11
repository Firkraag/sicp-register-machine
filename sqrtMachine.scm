(load "simulator.scm")
(define sqrt-machine
  (make-machine
    '(guess x t)
    (list (list '* *) (list '< <) (list '- -) (list 'abs abs) (list '+ +) (list '/ /))
    '((assign guess (const 1.0))
               test-guess 
               (assign t (op *) (reg guess) (reg guess)) 
               (assign t (op -) (reg t) (reg x))
               (assign t (op abs) (reg t))
               (test (op <) (reg t) (const 0.001))
               (branch (label sqrt-done))
               (assign t (op /) (reg x) (reg guess))
               (assign t (op +) (reg guess) (reg t))
               (assign guess (op /) (reg t) (const 2.0))
               (goto (label test-guess))
               sqrt-done)))
(set-register-contents! sqrt-machine 'x 38.0)
(start sqrt-machine)
(get-register-contents sqrt-machine 'guess)

