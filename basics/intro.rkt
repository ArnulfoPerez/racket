#lang racket

(provide (all-defined-out))
(define s "hello")
; Test introductiory file
(define cube1
  (lambda(x)
    (* x (* x x))))

(define (pow1 x y)
  (if (= y 0)
      1
      (* x (pow1 x (- y 1)))))

(define pow2
  (lambda (x)
    (lambda (y)
      (pow1 x y))))
(define three_to (pow2 3))

(define (sum xs)
  (if (null? xs)
      0
      (+ (car xs)(sum (cdr xs)))))

(define mylist(list 1 2 3 4))
(define mylist2 (cons 1 (cons 2 (cons 3 (cons 4 null)))))

(define fibo
  (letrec([memo null]
          [f (lambda (x)
               (let ([ans (assoc x memo)])
                 (if ans
                     (cdr ans)
                     (let ([new-ans (if (or (= x 1)(= x 2))
                                        1
                                        (+ (f (- x 1))
                                           (f (- x 2))))])
                       (begin
                         (set! memo (cons (cons x new-ans) memo))
                         new-ans)))))])
    f))

(define-syntax my-if
  (syntax-rules (then else)
    [(my-if e1 then e2 else e3)(if e1 e2 e3)]))

(define-syntax my-delay
  (syntax-rules ()
    [(my-delay e)(mcons #f (lambda() e))]))

(define sequence
  (lambda(low high stride)
    (* low (* low low))))