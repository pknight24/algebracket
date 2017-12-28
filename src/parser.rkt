#lang racket

(provide getVal hasX)

;;gets the x value at which to evaluate the derivative
(define (getVal l)
  (if (and (list? l) (not (null? (cdr l))))
    (if (eq? 'at (car l))
          (cadr l)
          (getVal (cdr l)))
    null))

;;determines whether or not a member of the function includes the 'x' variable
(define (hasX l)
  (cond [(null? l) #f]
        [(not (list? l)) (if (eq? l 'x) #t #f)] 
        [(eq? 'x (car l)) #t]
        [(list? (car l)) (if (hasX (car l)) #t (hasX (cdr l)))]
        [(not (null? (cdr l))) (hasX (cdr l))]
        [else #f]))

