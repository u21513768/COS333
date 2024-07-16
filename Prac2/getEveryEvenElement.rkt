#lang sicp
(define getEveryEvenElement
  (lambda (lst)
     (let loop ((res '()) (lst lst) (index 1))
      (cond
        ((null? lst) (reverse res))
        ((= (remainder index 2) 0)
         (loop (cons (car lst) res) (cdr lst) (+ index 1)))
        (else
         (loop res (cdr lst) (+ index 1)))))))
(getEveryEvenElement '(a b c d)) ;Should be (b d)
(getEveryEvenElement '(1 2 3 4 5 6 7 8 9 10)) ;Should be (2 4 6 8 10)