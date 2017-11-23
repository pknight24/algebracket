#lang racket
(require "parser.rkt" "funcs.rkt" "plug.rkt")


;;TODO: write a proper help menu
(define (showHelp) (display "Help menu"))


(define (getInput)
  (let* [(in (read))
         (val (getVal in))]
    (cond [(equal? in 'help) (showHelp)]
          [(equal? in 'exit) (exit)]
          [else 
            (if (null? val)
            (plug in val)
            (plug (take in (- (length in) 2)) val))])))

(define (loop f)
  (f)
  (loop f))



(getInput)
