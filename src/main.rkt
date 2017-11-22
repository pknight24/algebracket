#lang racket
(require "parser.rkt" "funcs.rkt")


;;TODO: write a proper help menu
(define (showHelp) (display "Help menu"))


(define (getInput)
  (let* [(in (read))
         (val (getVal in))]
    (cond [(equal? in 'help) (showHelp)]
          [(equal? in 'exit) (exit)]
          [else in])))

(define (loop f)
  (f)
  (loop f))



;;(loop getInput)
