#lang racket
(define s "hello")
(define x 3)
(define y (+ x 2))
(define cube1
  (lambda(x)
    (* x (* x x))))
(define (cube3 x)
  (* x x x))
(define (pow1 x y)
  (if (= y 0)
      1
      (* x (pow1 x (- y 1)))))
(define pow2
  (lambda(x)
    (lambda(y)
      (pow1 x y))))
(define three-to-the (pow2 3))

; sum elements of a list
(define (sum xs)
  (if (null? xs)
      0
      (+ (car xs)(sum (cdr xs)))))

;append
(define (my-append xs ys)
  (if (null? xs)
      ys
      (cons (car xs) (my-append (cdr xs) ys))))

; map

(define (my-map f x)
  (if (null? x)
      null
      (cons (f (car x)) (my-map f (cdr x)))))

