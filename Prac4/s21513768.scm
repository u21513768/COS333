#lang sicp
(define (stripNegativesDuplicateEvens lst)
  
  ; Function to check if a number is even
  (define (isEven n)
    (= (remainder n 2) 0))
  
  ; Function to remove negatives and duplicate evens
  (define (process-list lst accList)
    (cond ((null? lst) (reverse accList))
          ((< (car lst) 0) (process-list (cdr lst) accList)) ; Skip negatives
          ((isEven (car lst)) ; Duplicate even positives
           (process-list (cdr lst) (cons (car lst) (cons (car lst) accList))))
          (else ; Keep odd positives
           (process-list (cdr lst) (cons (car lst) accList)))))
  
  (process-list lst '())) ; Start processing with an empty list

(stripNegativesDuplicateEvens '(4 -1 9))
(stripNegativesDuplicateEvens '(6 8))