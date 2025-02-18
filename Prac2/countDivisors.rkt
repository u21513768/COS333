#lang sicp
(define countDivisors
  (lambda (val lst)
    (let loop ((counter 0) (lst lst))
      (cond
        ((null? lst) counter)
        ((= (remainder val (car lst)) 0)
         (loop (+ counter 1) (cdr lst)))
        (else
         (loop counter (cdr lst)))))))
(countDivisors 10 '(1 2 3 4 5 6 7 8 9 10)) ;Should be 4: 1 2 5 10
(countDivisors 100 '(1 2 3 4 5 10 15 20 25 50 75 100)) ;Should be 9: 1 2 4 5 10 20 25 100

