#lang racket
;(require htdp/testing)
(require test-engine/racket-tests)
(require racket/trace)

(define z 0)
(+ z 3)

(define (taste s)
    (cond
      [(equal? s "milk") 'good]
      [else 'not-as-good]))

(check-expect (taste "milk") 'good)
(check-expect z 0)
(test)

(define (f x) (if (zero? x) 0 (add1 (f (sub1 x)))))
(trace f)
(f 10)