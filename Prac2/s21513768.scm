#lang sicp
;Quintin d'Hotman de Villiers u21513768
(define circleArea
  (lambda (r)
    (let ((pi (/ 22 7)))
      (if (<= r 0)
          0
          (* pi (* r r))))))
(circleArea 1.8) ;Should be 10.182857142857143
(circleArea -1) ;Should be 0
(circleArea 0) ;Should be 0

(define countDivisors
  (lambda (val lst)
    (let loop ((counter 0) (lst lst))
      (cond
        ((null? lst) counter)
        ((= (remainder val (car lst)) 0)
         (loop (+ counter 1) (cdr lst)))
        (else
         (loop counter (cdr lst)))))))
(countDivisors 3 ' (1 3))
(countDivisors 3 '(2 3 1 9 5)) ;Should be 4: 1 2 5 10
(countDivisors 3 '(2 8)) ;Should be 9: 1 2 4 5 10 20 25 100
(countDivisors 3 '())

(define getEveryEvenElement
  (lambda (lst)
     (let loop ((res '()) (lst lst) (index 1))
      (cond
        ((null? lst) (reverse res))
        ((= (remainder index 2) 0)
         (loop (cons (car lst) res) (cdr lst) (+ index 1)))
        (else
         (loop res (cdr lst) (+ index 1)))))))
(getEveryEvenElement '(a b c d e f)) ;Should be (b d f)
(getEveryEvenElement '(a b c))
(getEveryEvenElement '()) ;Should be ()
(getEveryEvenElement '(1))