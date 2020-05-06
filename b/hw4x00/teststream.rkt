
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

(define (sequence low high stride )
  (if (> low high)
           null
           (cons low (sequence (+ low stride) high stride ))))

(define (string-append-map xs suffix)
  (map (lambda (str) (string-append str suffix)) xs))

(define (list-nth-mod xs n)
  (if (< n 0)
      (error "list-nth-mod: negative number")
      (if (null? xs)
      (error "list-nth-mod: empty list" )
      (car (list-tail xs (remainder n (length xs)))))))

(define (stream-for-n-steps s n)
  (if (<= n 0) null
      (cons (car s)(stream-for-n-steps (cdr s) (- n 1)))))

(define (in-module-n n) (stream-map (lambda (x) (remainder x n)) (in-naturals)))

(define funny-number-stream (stream-map (lambda (x) (if (= (remainder x 5) 0) (- x) x)) (in-naturals)))

(define dan-then-dog (stream-cons "dan.jpg" dog-then-dan))

(define dog-then-dan (stream-cons "dog.jpg" dan-then-dog))

(define (cycle-list l) (stream-map (lambda (x) (list-ref l x)) (in-module-n (length l))))

(define (cycle-lists xs ys)
  (stream-map (lambda (x) (cons (list-ref xs (remainder x (length xs)))(list-ref ys (remainder x (length ys)))))
              (in-naturals)))

(define (stream-add-zero s) (stream-map (lambda (x) (cons 0 x)) s))

(define (vector-assoc v vec)
  (let ([last (vector-length vec)])
  (let check ([i 0])
    (if (= i last) 
        #f
        (let ([item (vector-ref vec i)])
          (cond [(not (pair? item)) (check (add1 i))]
                [(equal? v (car item)) item]
                [else (check (add1 i))]))))))

(define (cached-assoc xs n)
         (letrec
             ([cache (make-vector n)]
              [cache-slot 0]
              [func (lambda(x)
                      (let ([from-cache (vector-assoc x cache)])
                        (if from-cache
                            from-cache
                            (let ([from-xs (vector-assoc x xs)])
                              (if from-xs
                                  (begin
                                    (vector-set! cache cache-slot from-xs)
                                    (set! cache-slot (remainder (+ cache-slot 1) n))
                                    from-xs) from-xs)))))]
              ) func))

(define-syntax while-less
  (syntax-rules (do)
    [(while-less e1 do e2)
     (let ([dummy e1])
       (letrec ([loop (lambda (x)
                        (if (>= x dummy)
                            #t
                            (loop e2)))])
         (loop e2)))]))