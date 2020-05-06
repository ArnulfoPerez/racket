#lang racket

;Program finds the maximum and the second largest number in a list of numbers
(define max1
  (lambda (xs)
  (match xs
    [(list) (error "Empty list")]
    [(list a) (error "List with only one element")]
    [(list a b) (if (> a b) (cons a b) (cons b a))]
    [(list a b c) (if (> a b) (cons a (max b c)) (cons b (max a c)))]
    [_ (define-values (lvs rvs)
         (split-at xs (quotient (length xs) 2)))
       (let ([ls (max1 lvs)]
             [rs (max1 rvs)])
       (if (> (car ls) (car rs))
           (cons (car ls)(max (cdr ls) (car rs)))
           (cons(car rs)(max (cdr rs) (car ls)))))])))