#lang racket

(define (merge as bs)
  (letrec
      ([aux
       (lambda (as bs inversions)
         (match* (as bs)
           [((list) bs) (values bs inversions)]
           [(as (list)) (values as inversions)]
           [((list a as ...) (list b bs ...))
            (if (< a b)
                (let-values ([(lst count)(aux as (cons b bs) inversions)]) (values (cons a lst) (+ inversions count)))
                (let-values ([(lst count)(aux (cons a as) bs inversions)]) (values (cons b lst) (+ inversions count (length as) 1))))]))])
       (aux as bs 0)))

(define (merge-sort vs)
  (letrec ([aux
            (lambda (vs inversions)
              (match vs
                [(list) (values vs 0)]
                [(list a) (values vs 0)]
                [_ (let*-values
                       ([(lvs rvs) (split-at vs (quotient (length vs) 2))]
                        [(llst linv) (aux lvs inversions)]
                        [(rlst rinv) (aux rvs inversions)]
                        [ (lst minv) (merge llst rlst)])
                     (values lst (+ linv minv rinv)))]))])
    (aux vs 0)))