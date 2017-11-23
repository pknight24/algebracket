#lang racket

(require "parser.rkt" "funcs.rkt")
(provide plug)

(define (plug f x)
  (db f) 
  
  (cond 
    
    ;;returns f if it is just a number. This will be used when evaluating long recursive chains with plug
    [(and (= (length f) 1) (number? (car f))) (car f)]
    
    ;;returns the value x if 'x is the only atom given
    [(and (= (length f) 1) (eq? (car f) 'x)) x]

    ;;if f is an expression like ((x + 1)), recursively plugs for car f
    [(= (length f) 1) (plug (car f) x) ]

    ;;plugs for each main operater as the first operation being done
    ;;substitutes the desired value for 'x if it is the first term
    ;;uses plug recursively to evaluate the rest of the equation
    [(add? f) 
      (display "addition")
      (cond 
        [(eq? 'x (car f))
          (+ x (plug (cddr f) x))]
        [(number? (car f))
          (+ (car f) (plug (cddr f) x))]
        [(list? (car f))
          (+ (plug (car f) x) (plug (cddr f) x))])]

    [(mult? f) 
      (display "multiplication")
      (cond 
        [(eq? 'x (car f))
          (* x (plug (cddr f) x))]
        [(number? (car f))
          (* (car f) (plug (cddr f) x))]
        [(list? (car f))
          (* (plug (car f) x) (plug (cddr f) x))])]

    [(sub? f) 
      (plug (convSub f) x)]

    [(div? f) 
      (plug (convDiv f) x)]

    [(exp? f) 
      (display "exponent")
      (cond 
        [(eq? 'x (car f))
          (^ x (plug (cddr f) x))]
        [(number? (car f))
          (^ (car f) (plug (cddr f) x))]
        [(list? (car f))
          (^ (plug (car f) x) (plug (cddr f) x))])]

    [else "Not accounted for yet"]
))

(define (db f)
  (newline)
  (newline)
  (display "f is: ")
  (display f)
  (newline)
  (display "Is f a list? ")
  (display (list? f))
  (newline))
