#lang sicp
(define circleArea
  (lambda (r)
    (let ((pi (/ 22 7)))
      (if (<= r 0)
          0
          (* pi (* r r))))))
(circleArea -1) ;Should be 0
(circleArea 3.2) ;Should be 32.182857142857145