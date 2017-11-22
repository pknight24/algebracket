#lang racket
(require "parser.rkt" "funcs.rkt" "derive.rkt")

;;;;Program which finds the derivatives of Polynomials at a certain value x

;;(display "Hello and welcome to deriv, a simple derivative calculator for polynomials.")
;;(newline)
;;(display "Type 'help' to see a list of instructions")
;;(newline)

;;TODO: write a proper help menu
(define (showHelp) (display "Help menu"))


;;gets user input and calls the deriv function
(define (getInput)
  (let* [(in (read))
         (val (getVal in))]
    (cond [(equal? in 'help) (showHelp)]
          [(equal? in 'exit) (exit)]
          [else (derive in val)])))

(define (loop f)
  (f)
  (loop f))



;;(loop getInput)
