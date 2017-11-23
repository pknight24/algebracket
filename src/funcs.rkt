#lang racket


(provide mult? sub? convSub add? div? convDiv exp? ^)

;;determines if an expression is multiplication
(define (mult? l)
  (cond [(and (list? l) (= (length l) 1))
         (mult? (car l))]
        [(and (list? l) (> (length l) 1))
         (if (eq? (cadr l) '*) #t #f)]
        [else #f]))

;;determines if an expression is subtraction
(define (sub? l)
  (if (list? l)
      (if (eq? (cadr l) '-) #t #f) #f))

;;converts subtraction expressions to addition
(define (convSub l)
   (append (list (car l)) '(+) (list (append (list (caddr l)) '(*) '(-1)))))

;;determines if an expression is addition
(define (add? l)
  (cond [(and (list? l) (= (length l) 1))
         (add? (car l))]
        [(and (list? l) (> (length l) 1))
         (if (eq? (cadr l) '+) #t #f)]
        [else #f]))

;;determines if an expression is division
(define (div? l)
  (if (list? l)
      (if (eq? (cadr l) '/) #t #f) #f))

;;converts division to multiplication
(define (convDiv l)
  (append (list (car l)) '(*) (list (/ 1 (caddr l)))))

;;determines if an expression is an exponent
(define (exp? l)
  (cond [(and (list? l) (= (length l) 1))
         (exp? (car l))]
        [(and (list? l) (> (length l) 1))
         (if (eq? (cadr l) '^) #t #f)]
        [else #f]))

(define (^ x n)
  (if (= n 0)
    1
    (* x (^ x (- n 1)))))

