#lang racket
(define (quicksort choose-pivot lst)
  (match lst
  ['() '()]
  [(list a) (list a)]
  [(list a b)
   (if ( < a b)
       (list a b)
       (list b a))]
  [_
   (define pivot (choose-pivot lst))
   (define (<pivot x) (< x pivot))
   (define-values (small large) (partition <pivot lst))
   (append (quicksort choose-pivot small)
           (quicksort choose-pivot large))]))
