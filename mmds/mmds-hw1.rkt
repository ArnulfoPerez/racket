#lang racket

;factorial
(define factt
  (lambda (n acc)
    (if (= n 0) 
        acc
        (factt (- n 1)  (* acc n )))))
(define fact
  (lambda(n)
    (factt n 1)))

; x^y
(define (pow x y)
  (if (= y 0)
      1
      (* x (pow x (- y 1)))))
;constants
(define people 1e9)
(define days 1000)
(define pr 1e-02)
(define capacity-hotel 1e2)
(define hotels 1e5)

;functions

(define two-in-hotel (/ (* pr pr) hotels))

(define (two-in-d x)
  (pow two-in-hotel x))

(define (p-in-hotel p) (/ (pow pr p) hotels))

(define pr-activity
  (lambda(p d)
    (pow (p-in-hotel p) d)))

(define days-choose-d
  (lambda (d)
    (/ (pow days d) (fact d))))

(define people-choose-p
  (lambda (p)
    (/ (pow people p) (fact p))))

(define random-cases
  (lambda(p d)
    (* (days-choose-d d)(people-choose-p p))))
  
(define suspects
  (lambda(p d)
    (* (pr-activity p d) (random-cases p d))))

(define p 3)
(define d 2)
(suspects p d)