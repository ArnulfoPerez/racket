#lang racket

(require racket/trace)

(define factorial 
  (lambda (n)
    (if (= n 0) 
        1
        (* n (factorial (- n 1))))))
(trace factorial)
(factorial 5)
;; Output:
;; >(factorial 5)
;; > (factorial 4)
;; > >(factorial 3)
;; > > (factorial 2)
;; > > >(factorial 1)
;; > > > (factorial 0)
;; < < < 1
;; < < <1
;; < < 2
;; < <6
;; < 24
;; <120
;; 120

(define factorial-tail
  (lambda (n acc)
    (if (= n 0) 
        acc
        (factorial-tail (- n 1)  (* acc n )))))
(trace factorial-tail)
(factorial-tail 5 1)
;; Output:
;; >(factorial-tail 5 1)
;; >(factorial-tail 4 5)
;; >(factorial-tail 3 20)
;; >(factorial-tail 2 60)
;; >(factorial-tail 1 120)
;; >(factorial-tail 0 120)
;; <120
;; 120